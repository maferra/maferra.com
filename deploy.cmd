rmdir /s /q public

call hugo --buildDrafts --debug --minify

call git add --all .
call git commit -S -m "Committed."
call git push

rem start s3 sync
call aws s3 sync public s3://maferra --delete
