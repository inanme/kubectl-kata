.PHONY: clean list install-app install-sts

install-app: cleanup
	kubectl apply -f echo-service-deployment.yml -n default --context docker-desktop 

install-sts: cleanup
	kubectl apply -f echo-service-sts.yml -n default --context docker-desktop
list:
	kubectl get pods -n default --context docker-desktop
	@echo ----------------------------------------------------------------------------
	kubectl get sts -n default --context docker-desktop
	@echo ----------------------------------------------------------------------------
	kubectl get deploy -n default --context docker-desktop
	@echo ----------------------------------------------------------------------------
	kubectl get svc -n default --context docker-desktop
	@echo ----------------------------------------------------------------------------
	kubectl get ep -n default --context docker-desktop
	@echo ----------------------------------------------------------------------------
	kubectl get ing -n default --context docker-desktop
cleanup:
	-kubectl delete ingress app-ingress app-sts example-ingress     -n default --context docker-desktop
	-kubectl delete service app-service app-service-sts apple-service apple-sts banana-service     -n default --context docker-desktop
	-kubectl delete deploy apple-deployment -n default --context docker-desktop
	-kubectl delete sts apple-sts -n default --context docker-desktop
	-kubectl delete pod apple-app banana-app -n default --context docker-desktop
