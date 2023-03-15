---
title: "SQL"
tags:
- SQL
---

## Rollup Query
- 사용 방법: SUM(COLUMN_2) ... GROUP BY COLUMN_1, ROLLUP(COLUMN_1)
- 결과: Column 1 별 Column 2의 SUM 결과들이 표현되면서 그 다음 Row에 SUM 결과들의 합도 표현된다.
