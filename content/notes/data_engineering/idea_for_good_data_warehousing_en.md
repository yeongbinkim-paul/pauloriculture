---
title: "[DE] Idea for good Data Warehousing (EN)"
tags:
- Idea
- Data Warehousing
- Data Stage
- Data Engineering
- EN
---


# Idea for good Data Warehousing (EN)
A good data engineer should be able to manage a data warehouse well.
Because although many say that the scope of what a data engineer does is too broad, the most important task is building a good place to store and work with data.
Today I've written a few important things to remember while building and managing a data warehouse.

## What is Data Warehouse?
Let's start with the definition of a data warehouse.
First introduced in 1992 in the book Building the Data Warehouse by Inmon W.H., a data warehouse is where data is gathered from multiple data sources, subject-oriented, and integrated. Inmon also says that a data warehouse should be time-variant, meaning that all data can be identified in a specific time interval, and non-volatile, meaning that data can be added but not erased to maintain a consistent purpose.

This data warehouse is defined in its most general scope, so there is a difference between that and the data warehouses that do the job nowadays.
This is because today's data warehouses are complete with many other external factors, including the purpose of the data and the cost of storing and processing it.

I will talk about some things that can be added to this definition that are important to consider when designing and building a data warehouse.

## Domain knowledge for Designing a Data Warehouse
Domain knowledge is critical because data engineers should work with data based on well-developed logic.
If data engineers have a background in where the data is being used, they can distinguish the correlation and causation of each piece of data. If not, this will not be treating the data based on logic. It will be data processing to make it look good and will not serve any purpose.
That's why as a data engineer, you must have good domain knowledge and try to understand all of the data you're dealing with, in what form it exists, and how it's used.

While this may seem like a similar perspective to domain-driven design, it's a little different.
It's well known that you can achieve high productivity, low complexity, and easy communication by adopting a domain-driven design in general. A data warehouse with domain knowledge can achieve various performance optimizations that best reflect the current data characteristics while keeping the data as usable as possible.


## Demand forecasting in the data warehouse design process
If there is one remaining challenge for data engineers with good domain knowledge, it's demand forecasting.
Demand forecasting refers to forecasting the demand for data that consumers will frequently use in the data warehouse for analytical purposes and preparing that data in a usable form.
Most data is multidimensional, meaning that the same data can be separated into multiple dimensions and used for analysis.
As mentioned earlier, Data engineers must work with data based on well-developed logic.
When dealing with multidimensional data, you must analyze multiple dimensions to see correlations.
However, not all correlations lead to meaningful causal analysis, so data engineers must have many conversations with consumers who use the data they create.
Often, the consumers, in this case, will be people in cross-functional roles, such as data analysts, backend engineers, project managers, and product managers. These people have the same goal: to work with data, so they should have a broad understanding of a well-defined goal.
In creating a data product, you must draw insights from multiple data points. As a data engineer, you work closest to the data sources, so you have the first access to this data and can easily do the most basic analysis.

## 내가 데이터 아키텍쳐를 만든다면,
그렇기 때문에, 잘 갖춰진 도메인 지식을 바탕으로 가장 먼저 데이터의 전반적인 이해를 갖추고, 소비자의 수요를 이해한 다음에 이에 따라 데이터 아키텍쳐를 설계할 수 있어야 한다고 생각합니다.
이 과정을 세심하게 따르지 않는다면, 여러 가지 데이터 수요에 대응하지 못하고, 수시로 데이터 스키마를 변경하거나 데이터 아키텍쳐 리팩토링을 하느라 시간을 소모하게 될 것이라고 생각합니다.
제가 데이터 아키텍쳐를 처음부터 설계한다면, 어떤 것들을 고려하고자 하는 지 적어보려고 합니다.

### 1. Understand as much as you can about the data you have right now.
Data architectures designed without fully understanding the data on your desk are short-lived. As I said above, you need to take the time to understand the data you have and what you need to accomplish by communicating with the consumers of that data.

### 2. Determine what you must accomplish first and how you will get there.
Every data architecture has a business feasibility and a concise, maintainable architecture that considers all possibilities doesn't exist in the real world. First and foremost, you need to consider how you can accomplish what you need to complete, and in doing so, adopt the easiest and least expensive tech spec and implementation possible because the business logic will inevitably become more complex.

Here are some of the things I like to consider during this process
a) Requirements from the consumer perspective:
Please communicate with the data analysts and backend engineers who will consume the output of your data pipeline to understand their requirements. There should be an agreement on the information that must be included, the data format, and the frequency of data updates. This could take the form of an SLA. Ideally, if you're looking for a flawless implementation, you should be able to break down achievable goals with business feasibility, calculate a timeline, and get the work done.

b) Selecting tech specs:
You need to select a tech spec for the implementation, which includes:
    1. the data infrastructure architecture,
    2. the technical familiarity of the team members with the data infrastructure,
    3. a weekly/monthly cost estimate for the data infrastructure, and
    4. a time estimate for the implementation.
The problem is that all the factors are highly uncertain, and it's hard to determine the order of importance. This is because the problem you're trying to solve looks different for every team in every company.
I think the first thing to do in this situation is to do a Pre-Mortem with your team.
In his book 'Thinking, Fast and Slow', Daniel Kahneman refers to the concept of the planning fallacy, stating that many people become overconfident and fail to carry out their plans by creating unrealistic best-case scenarios or ignoring outside perspectives to find examples of similar situations.
To address the optimism that causes it, he suggests Pre-Mortem. Applying this concept to our problem, we can proceed as follows.
1) Get together with your team and explain why this tech spec will fail miserably in 1, 3, or 6 months.
2) For each reason for failure, identify ways to prevent it in the planning process.
3) Briefly explore external examples that address each reason for failure.

These steps can prevent the team from collectively conforming to a decision and allow knowledgeable people to use their imaginations to identify risks in a desirable direction.
If you go through this process and then go back and select a tech spec that best satisfies the four considerations above, you will have a much more reliable tech spec.

### 3. Plan your data stages.
For each stage, you need to define the purpose of the executed ETL jobs and the resulting data's role.
For example, one way to plan is to divide the stages into DATA LAKE, where data sources are loaded; DATA WAREHOUSE, which contains processed data; and DATA MART, which the consumers will use for actual products or analytics. The clearer the role of the pipe that processes data in each stage, the better it will be to identify improvement points when improving the structure in the future.
Here's the guiding principle

a) Rules for Storing data:
Each stage should have clear rules for storing data. For example, not all stages need to be non-volatile, but Source must be non-volatile.
b) Rules for categorizing data:
Make sure you have clear rules for categorizing data in each stage. For example, the nature of data in a DATA MART can be data with new information generated from multiple data sources or data that has a clearly defined use outside of the pipeline. Be clear about the rationale for categorizing and storing data in each stage.
c) Rules for processing data:
Make sure you have clear rules for processing data in each stage. For example, a pipeline that processes data in the stage before the DATA MART can enforce logic that guarantees equality. Or, when processing data in the data lake, you can enforce rules that only allow changing data type or column name.
d) Rules for handling exception:
Respond to any exceptions you may find to the above rules based on business feasibility, but make sure that all exceptions are recorded as re-architecting points so that they can be revisited.

The trickiest part of these rules is the data categorization rules. For example, the tables in DATA MART are used for Products as they are, but you can join multiple mart tables to create a new table for analysis.
You can make the following judgments to deal with these cases.
a) Consider whether other sources can be used to produce data for analytical purposes instead of using DATA MART tables as sources.
B) You should be able to consider whether you can build a new DATA WAREHOUSE with DATA MART tables as its source for analytical purposes.

Depending on your business situation, I'm sure there are other options to consider, but this is where data engineers grow from much experience and study.

### 4. Plan how you will manage your data lineage.
The more complex your business logic becomes, the more likely you are to have a single point of failure due to the people who planned the data architecture in the first place, so you need to think about how to manage Data Lineage in a way that anyone can learn. If it's difficult for everyone to learn, you will end up with SPF.
To ensure that to configure Data Lineage in a way that doesn't hurt your productivity, we recommend avoiding the following situations as much as possible.
a) If you must create a cyclic structure within one data warehouse.
b) When processing data by referring to sources contained in different data stages
Both situations would undermine the definition of the data stages we planned in #3.
These problems are best solved by leveraging domain knowledge, business goals, and stakeholder communication because complex data lineage will eventually become a bottleneck for data productivity.

There are choices here that you should avoid at all costs.
a) The solution of changing how data analysts or data backend engineers handle things: This solution will eventually lead to you facing the same problem again.
b) Choosing complexity because it is unavoidable and utilizing the resulting data as a source for subsequent data: If you choose to allow exceptions because complexity is an inevitable feature of your structure, you must control that the exceptions allowed do not increase complexity downstream.

### 5. Plan how you will validate, verify, and monitor your data.
We will always encounter unexpected exception data, even with good data architecture.
These exceptions can happen by complex logic that exceeds the scope of allocated resources, outlier inputs that don't have a business impact, or schema changes or version upgrades to the data source.
Data quality is more important to data engineers than anything else, so they must be the first to identify and respond to possible exceptions for all data-handling pipelines.
So, to complete a good data architecture, you need to decide how to organize your validation and verification and how to monitor it.
Here's what I consider important about Validation, Verification, and Monitoring.
a) You should be able to verify that it follows the definition of a Stage.
b) Depending on the data lineage, you should ensure each validation logic that verifies data for a specific point. You should not perform validation of the same objective at multiple stages.
c)  You should separately record exception data identified during the validation process and leverage it in the verification rule.
d) You should monitor by identifying the points where the most exceptions occurred during development but should evolve through issues during production to avoid gray areas.

## Conclusion
There isn't a right answer to good data architecture because better technologies are always introduced into the world, and more creative solutions can be found. While creating that answer, we should always be careful about what we must catch. What we achieve may not be the best, it may be the second best, but we can create another best if we aim for best practices and don't forget what we need to consider to do that.
