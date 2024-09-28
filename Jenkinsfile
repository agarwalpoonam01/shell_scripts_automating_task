pipeline{
    agent any
    environment{
        CC = 'clang'
        gpg_secret = credentials("gpg-secret")
        gpg_trust = credentials("gpg-ownertrust")
        gpg_passphrase = credentials("gpg-passphrase")
    }
    stages{
        stage("example"){
            steps{
                sh """
                    gpg --batch --import $gpg_secret
                    gpg --import-ownertrust $gpg_trust
                    git secret reveal -p '$gpg_passphrase'
                    git secret cat dbpassword.txt
                """
            }
        }
    }
}
