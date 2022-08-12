SRC :=	srcs/docker-compose.yml

DCMP :=	docker-compose

all: $(SRC)
	$(DCMP) -f $(SRC) up --build --remove-orphans -d
	$(DCMP) -f $(SRC) logs --tail 100 -f

clean:
	$(DCMP) -f $(SRC) stop

fclean: clean
	$(DCMP) -f $(SRC) down
