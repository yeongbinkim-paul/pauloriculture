---
title: "[DE] Pandas As an SQL (EN)"
tags:
- Skill
- Python
- SQL
- Pandas
- EN
---


## Pandas as an SQL
Date : June 20, 2023

I studied PANDAS as an SQL Statement
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
If you were to write a query above in Pandas, you would write it like a code below:

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
