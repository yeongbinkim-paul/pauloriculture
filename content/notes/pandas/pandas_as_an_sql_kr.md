---
title: "[DE] Pandas As an SQL (KR)"
tags:
- Python
- SQL
- Pandas
- Data Engineering
- KR
---


## SQL처럼 쓰는 Pandas
작성 일자 : 2023년 6월 20일

Pandas를 SQL문처럼 공부해봤습니다.
```sql
SELECT
    table.a,
    table.b as b1,
    table2.c as c1,
    table2.d,
    sum(table2.e) as e1
FROM table
LEFT JOIN table2
ON table.a = table2.a
WHERE true
  AND table.a > 0
  AND (table.b = "None" or table2.c > 0)
GROUP BY table.a, table.b, table2.c, table2.d
HAVING f1 > 0
ORDER BY table.a ASC, table.b DESC, table2.c ASC
LIMIT 100
OFFSET 10
```
이라는 쿼리를 Pandas로 작성한다면, 아래와 같이 코드를 작성합니다.

```python
import pandas as pd

table = pd.DataFrame(
    {
        'a': [1,2,3],
        'b': ["4","4","6"],
    }
)

table2 = pd.DataFrame(
        {
                'a': [1,2,3],
                'c': [1,2,3],
                'd': ["4","6","4"],
                'e': [1,2,3],
        }
)

result = (
    table.merge(table2, on='a', how='left') # Join
        [['a', 'b', 'c', 'd', 'e'] ] # Select
        .rename(columns={'b': 'b1', 'c': 'c1'}) # Alias
        .query('a > 0 & (b1 == "None" | c1 > 0)') # Where
        .groupby(['a', 'b1', 'c1', 'd', 'e']) # Group by
        .agg(
                e1 = ('e', 'sum')
        ) # Aggregation
        .reset_index() # Reset Index - without this, the dataframe has multiple index consisted of columns which were used in group by statement
        .query('e1 >= 0') # Having
        .sort_values(['a', 'b1', 'c1'], ascending=[True, False, True]) # Order by
        .iloc[10:110] # limit and offset
)

```
