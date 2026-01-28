# notes
clone repo-nya ke lokal
``
git clone https://github.com/leleteri/Student-Hub-Web
``
lampirin semua file .nix ke chatgpt trus minta arahin buat environment & dependencies buildnya untuk windows / os lain
 
run di direktori backend
``
alembic revision --autogenerate -m "init"
alembic upgrade head
``

cek db lokal
``
psql
\dt
``
muncul tabel = ok!

masih di direktori backend
``
uvicorn app.main:app --reload
``

ke browser, buka localhost:8000/docs, mestinya muncul swagger UI
coba-coba aja
