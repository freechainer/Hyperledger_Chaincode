docker exec cli peer chaincode install -n sacc -v 2 -p github.com/saccv2
docker exec cli peer chaincode upgrade -n sacc -v 2 -C mychannel -c '{"Args":[]}' -P 'OR ("Org1MSP.member", "Org2MSP.member", "Org3MSP.member")'
sleep 5
docker exec cli peer chaincode query -n sacc -C mychannel -c '{"Args":["getAllKeys"]}'
docker exec cli peer chaincode invoke -n sacc -C mychannel -c '{"Args":["set","c","300"]}'
sleep 5
docker exec cli peer chaincode query -n sacc -C mychannel -c '{"Args":["getAllkeys"]}'