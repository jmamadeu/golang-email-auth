package main

import "github.com/gin-gonic/gin"

type User struct {
	Name  string `json:"name"`
	Email string `json:"email"`
}

type Response struct {
	Data interface{} `json:"data"`
}

func main() {
	router := gin.Default()

	v1 := router.Group("/api/v1")
	users := v1.Group("/users")

	users.GET("/", func(c *gin.Context) {
		c.JSON(200, Response{
			Data: []User{
				{
					"Joao",
					"joao@amadeu.com",
				},
				{
					"Amadeu",
					"amadeu@joao.com",
				},
			},
		})
	})

	users.GET("/:id", func(c *gin.Context) {
		c.JSON(200, Response{
			Data: User{
				"Joao",
				"joao@amadeu.com",
			},
		})
	})

	router.Run(":3333")
}
