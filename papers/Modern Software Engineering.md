# Modern Software Engineering:

Apunte de Modern Software Engineering capitulos 1,2 (hasta a working definiton...) y 3

## Chapter 1: Introduction

### Software engineering Definition

Software engineering is the application of an empirical, scientific
approach to finding efficient, economic solutions to practical
problems in software.

### Experts at learnning

- Iteration
- Feedback
- Incrementalism
- Experimentation
- Empiricism

### Experts at managing complexity

- Modularity
- Cohesion
- Separation of Concerns
- Abstractions
- Loose Coupling

### Practical tools to drive an effective strategy

Some actual tools described in the book to create software of higher quality are the following:

- Testability
- Deployability
- Speed
- Controlling the variables
- Continuous delivery

### The Birth of Software Engineering

The first clear distinction of software and hardware came with the idea of "stored program".
The stored programm appeared as the alternative of programming by flipping switches and hardcoding proggrams, which seemed slow and inflexble.
As programms became more complex and difficult to mantain, the so called _software crisis_ came, it isdescribed as a significant gap between the rate at which progress was being made in hardware compared to the rate at which it was being made in software. \
The NATO conference was convened, in part, in response to this
crisis.

Brooks statement about the _software crisis_:\
_We must observe that the anomaly is not that software progress is so
slow but that computer hardware progress is so fast. No other technology
since civilization began has seen six orders of magnitude priceperformance gain in 30 years._

### Chapter summary

_Applying this kind of engineering thinking to software does not need
to be heavyweight or overly complex. The paradigm shift in thinking
differently about what it is that we do, and how we do it, when we
create software should help us to see the wood for the trees and
make this simpler, more reliable, and more efficient.
This is not about more bureaucracy; it is about enhancing our ability
to create high-quality software more sustainably and more reliably._

## Chapter 2: What Is Engineering?

#### Production Is Not Our Problem

In this section a distintion is made between the software indsutry and most industries. For most developments, the biggest challenge is production. Getting a product to mass production is a hard task. Software development in the other hand is a "simple" and cheap process, usually solved by pressing a button. \
The author explains that in software we should not apply a _production-style thinking_, production is not our problem and we should not fall in misunderstanding or misapplied thinking, and practices because of this thinking.

### Design Engineering, Not Production Engineering

A major advantave in software engineering over other types of engineering is that our computational models doesn't
have to math reality, the model itself is the reality, unlike in bridge engineering where the virtual models they develop try to match reality.
This characteristic make software proudcts way simpler and cheaper to change.\
It is important that software engineering is practiced with some scientific rationalism in mind, but it is
crucial not to seek mathematical presition while doing so.

"Software development, unlike all physical production processes, is
wholly an exercise in discovery, learning, and design. Our problem is
one of exploration, and so we, even more than the spaceship
designers, should be applying the techniques of exploration rather
than the techniques of production engineering. Ours is solely a
discipline of design engineering."

### Principles of the first software engineer

- Focus on how things fail:
  This focus was grounded in a scientifically rational approach to problem solving. Treating designs with
  skepticism until you run with ideas of how it could go wrong was the way to go.

- Failing safely:
  The assumption is that we can never code for every scenario, so we need to make systems to cope with the unexpected.

### A Working Definition of Engineering

"Engineering is the application of an empirical, scientific approach
to finding efficient, economic solutions to practical problems."

## Chapter 3: Fundamentals of an Engineering Approach

### An Industry of Change?

In this section it is discussed how new techonologies and products are constantly appearing.
Such technologies generally don't have a real impact on making progress in the industry and some times
do more wrong than good.\
The only big changes that made a real difference were from asemmbler to C (procedure programming) and Procedure to
OO programming, the author says.\
He also states that we find it difficult to learn new ideas, and even more difficult to discard old ideas.

### The Importance of Measurement

We find it difficult to discard bad ideas because we struggle to measure performance developig code.
Many metrics are not useful, like velocity or lines of code.\
Many pepole says useful measurement of a team is not possible.\
The book Accelerate: The Science of Lean Software & DevOps, present a way to measure the performance of teams.
They demonstrate a statisticall correlation between the performance of a team and _stability_ and _throughput_ \
Teams with high stability and high throughput are classified as “high performers,” while teams with low scores against these measures are “low performers.” \

**Stability** is tracked by the following:

- **Change Failure Rate**: The rate at which a change introduces a defect at a particular point in the process
- **Recovery Failure Time**: How long to recover from a failure at a particular point in the process

**Throughput** is tracked by the following:

- **Lead Time**: A measure of the efficiency of the development process. How long for a single-line change to go from “idea” to “working software”?
- **Frequency**: A measure of speed. How often are changes deployed into production?

Throughput is a measure of a team’s efficiency at delivering ideas, in
the form of working software.

These are technical measures of our development approach. They answer the questions “what is the quality of our work?” and “how efficiently can we produce work of that quality?”\

The book dispel the belief that “you can have either speed or quality but not both.”. Speed and quality are clearly correlated in the data from this research.

### The Foundations of a Software Engineering Discipline

There are two main ideas: _process_ and _technique or design_.\
We should focus in:

- Become **experts at learning** : Mastering the skills of exploration, discovery, and learning.
  This is a practical application of a scientific style of reasoning.
- Become **experts at managing complexity** : Beeing able to cope with systems on large scales and working with large teams.

### Experts at learning, 5 behaviors

- Working iteratively
- Employing fast, high-quality feedback
- Working incrementally
- Being experimental
- Being empirical

### Experts managing complexity, 5 behaviors

- Modularity
- Cohesion
- Separation of concerns
- Information hiding/abstraction
- Coupling

### Chapter Summary

The tools of our trade are often not really what we think they are.
The languages, tools, and frameworks that we use change over time
and from project to project. The ideas that facilitate our learning and
allow us to deal with the complexity of the systems that we create
are the real tools of our trade. By focusing on these things, it will help
us to better choose the languages, wield the tools, and apply the
frameworks in ways that help us to do a more effective job of solving
problems with software.
Having a “yardstick” that allows us to evaluate these things is an
enormous advantage if we want to make decisions based on
evidence and data, rather than fashion of guesswork. When making
a choice, we should ask ourselves, “does this increase the quality of
the software that we create?” measured by the metrics of stability.
Or “does this increase the efficiency with which we create software
of that quality” measured by throughput. If it doesn’t make either of
these things worse, we can pick what we prefer; otherwise, why
would we
