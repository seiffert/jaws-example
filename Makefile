AWS_CREDENTIALS_FILE := .aws/credentials
AWS_CREDENTIALS_DIR := .aws

$(AWS_CREDENTIALS_DIR):
	mkdir -p $(AWS_CREDENTIALS_DIR)

$(AWS_CREDENTIALS_FILE): $(AWS_CREDENTIALS_DIR)
	@printf "[default]\naws_access_key_id = $(AWS_ACCESS_KEY_ID)\naws_secret_access_key = $(AWS_SECRET_ACCESS_KEY)" > $(AWS_CREDENTIALS_FILE)

deploy: $(AWS_CREDENTIALS_FILE)
	HOME=$(CURDIR) jaws --aws-profile default dash
