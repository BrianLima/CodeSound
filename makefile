build :
	@echo "Building"
	docker-compose build
	docker-compose run app bin/setup
	docker-compose run app rake db:migrate