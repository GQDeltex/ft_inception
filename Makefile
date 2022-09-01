SRC :=	srcs/docker-compose.yml
BONUS := srcs/docker-compose.bonus.yml

DCMP :=	$(shell which "docker-compose")

all: up
	$(DCMP) -f $(SRC) logs --tail 100 -f

up: $(SRC)
	mkdir -p ./data/wordpress
	mkdir -p ./data/mariadb
	$(DCMP) -f $(SRC) up --build --remove-orphans -d

upbonus: $(SRC) $(BONUS)
	mkdir -p ./data/wordpress
	mkdir -p ./data/mariadb
	$(DCMP) -f $(SRC) -f $(BONUS) up --build --remove-orphans -d

bonus: upbonus $(BONUS)
	$(DCMP) -f $(SRC) -f $(BONUS) logs --tail 100 -f

clean:
	$(DCMP) -f $(SRC) -f $(BONUS) stop

fclean: clean
	$(DCMP) -f $(SRC) -f $(BONUS) down

re: fclean all

.PHONY: all up upbonus bonus clean fclean re
