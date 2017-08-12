<?php

require '../vendor/autoload.php';

$pdo = new PDO(
    "mysql:dbname=isuconp;host=localhost;port=3306;charset=utf8mb4",
    'isucon',
    'hoge'
);

$sth = $pdo->prepare('select id, mime, imgdata from posts');
$sth->execute();

foreach ($sth->fetchAll() as $p) {
    switch ($p['mime']) {
        case 'image/jpeg':
            $fileName = $p['id'].'.jpg';
            break;
        case 'image/png':
            $fileName = $p['id'].'.png';
            break;
        case 'image/gif':
            $fileName = $p['id'].'.gif';
            break;
    }

    file_put_contents(
        '/home/h-shinoda/isucogram-de-asobu/public/image/'.$fileName,
        $p['imgdata']
    );
}
