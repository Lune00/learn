<?php
require_once '../../2-poo/autoLoad/autoLoad.php';

$formulaire1 = new Form2('Adresse client', 'tp1traitement.php');
$formulaire1->setText('Nom', '', true, ['placeholder' => 'votre nom...',
                                        'title' => 'Entrez ici votre nom',
                                        'maxlength' => '30']);
$formulaire1->setText('Prénom', '', true, ['placeholder' => 'votre prénom...',
                                        'title' => 'Entrez ici votre prénom',
                                        'maxlength' => '30']);
$formulaire1->setText('Adresse', '', true, ['placeholder' =>
                                                'le numéro et nom de la rue...',
                                        'title' => 'Entrez ici votre adresse',
                                        'maxlength' => '120']);
$formulaire1->setText('CP', '', true, ['placeholder' => 'votre code postal...',
                                        'title' =>
                                                'Entrez ici votre code postal',
                                        'maxlength' => '5']);
$formulaire1->setText('Ville', '', true, ['placeholder' => 'votre ville...',
                                        'title' => 'Entrez ici votre ville',
                                        'maxlength' => '30']);
$formulaire1->setSubmit('Envoyer le formulaire');
echo $formulaire1->getForm();
