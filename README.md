# edk2-dev-env
docker file and scripts for edk2 dev

# Utilisation:
<ins>Sous linux:</ins>

Installez docker et git 

Récupérez le code avec git:
git clone https://github.com/jeanfrancoiswojcieszak/edk2-dev-env.git

Construction du conteneur:

cd edk2-dev-env

chmod a+x {build,start,test}.sh

./build.sh

Placez votre projet efi dans le dossier ProjectFiles, puis lancez l'instance docker:

./start.sh

à l'invite de commande de l'instance, créez un liens symbolique de votre projet (il est dans /app/ProjectPkg/) vers le repertoire /app/edk2/ :

ln -sf /app/ProjectPkg/<votre projet> /app/edk2/<votre projet>

puis lancez le build (toujours dans le shell de l'instance docker):

cd /app/edk2

. edksetup.sh

build -a X64 -t GCC5 -p <votre projet>

Vous pouvez tester l'executable efi résultant dans un autre terminal:

cd <répertoire de edk2-dev-env>

sudo ./test.sh

(appuyez vite sur echap pour entrer dans le bios de la vm et choisir de booter dans un shell efi)

Dans la vm:

FS0:

cd <Votre projetPkg>

cd DEBUG_GCC5

cd X64

projet.efi



