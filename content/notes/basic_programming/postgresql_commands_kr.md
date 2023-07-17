---
title: "[Basic] Postgres Commands (KR)"
tags:
- Skill
- Basic
- Postgres
- KR
---
# DB 접속
```
psql postgresql://{username}:{password}@{host}:{port}/{database_name}
```

# get database list & choice database
```
\l
\c {database_name}
```

# get table list
```
\dt
```

# get table information
```
\d {table_name}
```

# exit
```
\q
```
