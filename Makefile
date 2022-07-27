SRC :=	srcs/docker-compose.yml

DCMP :=	docker-compose

all: $(SRC)
	$(DCMP) -f $(SRC) up --build --remove-orphans

clean:
	$(DCMP) -f $(SRC) stop

fclean: clean
	$(DCMP) -f $(SRC) down
