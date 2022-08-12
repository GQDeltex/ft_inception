SRC :=	srcs/docker-compose.yml

DCMP :=	docker-compose

all: $(SRC) up
	$(DCMP) -f $(SRC) logs --tail 100 -f

up:
	$(DCMP) -f $(SRC) up --build --remove-orphans -d

clean:
	$(DCMP) -f $(SRC) stop

fclean: clean
	$(DCMP) -f $(SRC) down
