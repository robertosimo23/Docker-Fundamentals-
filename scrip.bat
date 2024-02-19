echo "Criando as imagens......."

docker build -t robertosimo23/projeto-backend:1.0 backend/.
docker build -t robertosimo23/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push denilsonbonatti/projeto-backend:1.0
docker push denilsonbonatti/projeto-database:1.0

echo "Ceiando serviços do cluster kubernetes....."

kubctl apply -f ./services.yml

echo "Criando os deployments......"

kubectl apply -f ./deployments.yml



