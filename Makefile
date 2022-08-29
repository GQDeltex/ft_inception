SRC :=	srcs/docker-compose.yml

DCMP :=	$(shell which "docker-compose")

all: up
	$(DCMP) -f $(SRC) logs --tail 100 -f

up: $(SRC)
	$(DCMP) -f $(SRC) up --build --remove-orphans -d

clean:
	$(DCMP) -f $(SRC) stop

fclean: clean
	$(DCMP) -f $(SRC) down

re: fclean all
