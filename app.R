library(shiny)
library(redux)
redis <- hiredis()

user_interface <- fluidPage(
	titlePanel("Aplicaçao Web"),
	textInput("login", "Informe seu login"),
	actionButton("botao", "Processar"),
	h1(textOutput("resultado"))
)

server <- function(input, output) {
	observeEvent(input$botao, {
		login = input$login
		
		if (redis$EXISTS(login)==TRUE)
		{
			output$resultado = renderText({paste(
					"Login Ativo, criado em:",
					as.character(redis$GET(login)),
					"Expiraçao do usuario: ",
					as.character(redis$TTL(login)),
					"segundos!", sep=" "
							)})
		}
		else
		{
			fdate <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
			redis$SET(login, fdate)
			redis$EXPIRE(login, 10)
			output$resultado = renderText({'Login Registrado!'})
		}
		
	})
}

shinyApp(ui=user_interface, server=server)
