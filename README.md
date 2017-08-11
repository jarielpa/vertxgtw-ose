# vertxgtw-ose

Login with oc client.

To build image

	oc create -f vertxgtw-bc.yaml
	
	
To deploy and expose service

	oc process -f vertxgtw-svc-dc.yaml | oc create -f -
	


