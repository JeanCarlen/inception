run:
	@docker compose -f docker-compose.yml up -d --build
	mkdir data
	mkdir data/mysql
	mkdir data/wordpress

down:
	@docker compose -f docker-compose.yml down

re:
	@docker compose -f docker-compose.yml up -d --build

fclean:
	docker system prune -af
	rm -rf ./data/wordpress/*
	rm -rf ./data/mysql/*

clean:
	rm -rf ./data/wordpress/*
	rm -rf ./data/mysql/*
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\


.PHONY: all re down clean fclean