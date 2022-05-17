.PHONY: all

all:
	docker build -t shipperstack/shipper:$SHIPPER_VERSION .
