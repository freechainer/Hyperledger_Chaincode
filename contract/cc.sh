docker exec cli peer chaincode install -n sacc -v 1 -p github.com/sacc
docker exec cli peer chaincode list --installed
docker exec cli peer chaincode instantiate -n sacc -v 1 -C mychannel -c '{"Args":["a","100"]}' -P 'OR ("Org1MSP.member", "Org2MSP.member", "Org3MSP.member")'
sleep 5
docker exec cli peer chaincode list --instantiated -C mychannel
docker exec cli peer chaincode query -n sacc -C mychannel -c '{"Args":["get","a"]}'
docker exec cli peer chaincode invoke -n sacc -C mychannel -c '{"Args":["set","b","200"]}'
sleep 5
docker exec cli peer chaincode query -n sacc -C mychannel -c '{"Args":["get","b"]}'