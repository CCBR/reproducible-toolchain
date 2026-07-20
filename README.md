

# reproducible-toolchain

<!-- this file is generated from README.qmd. please edit README.qmd only. -->

Anatomy of a modular toolchain for reproducible bioinformatics workflows

<a href="https://ccbr.github.io/reproducible-toolchain/"><img src="./img/toolchain-components.jpg" align="center" height="250" alt="Reproducible Toolchain" /></a>

Template Repository: <https://github.com/CCBR/CCBR_NextflowTemplate>

### Presentations

This project has been presented in a few forums:

- [ISMB Bioinformatics Open Source Conference 2026
  (poster)](poster/BOSC-2026.qmd)
- [Reproducibility in Science 2026
  (poster)](abstract/reproducibility-2026.qmd)
- [ABCS Technical Workshop 2026
  (talk)](slides/abcs-tech-workshop-2026-05.qmd)

## Abstract

The reproducibility and replicability of data-intensive biological
studies depend on the quality of the software used during data analysis.
Here we describe a toolchain for the development of reproducible
bioinformatics workflows that follow established guidelines for
high-quality scientific software. The central component is a template
repository for generating new pipeline repositories, ensuring consistent
structure across the whole suite of pipelines we have developed. Each
pipeline step points to a container to define dependencies, with Docker
recipes stored in a central repository for reuse. A Python-based
command-line interface (CLI) provides user-friendly commands for
initializing projects and launching the pipeline on HPC systems. The CLI
uses functions from a shared package to reduce code duplication across
template deployments and to streamline ongoing maintenance. Because the
interface is consistent, once a biologist uses one of our pipelines,
they can easily use others, regardless of which workflow language is
used by the developers. The template also contains continuous
integration workflows via GitHub Actions for testing, enforcing code
format and quality, deploying documentation, and preparing releases.
Custom GitHub Actions are defined in a standalone repository for reuse
in CI workflows across our organization. Using this toolchain, we have
developed multiple Nextflow pipelines for analyzing data from
whole-genome sequencing, ChIP-seq, single-cell RNA-seq, and CRISPR
experiments, with additional workflows in development. This approach has
streamlined our development and maintenance processes by enabling faster
updates and consistent improvements across pipelines while following
best practices including modular design, code reuse, automated testing,
clear documentation, and standardized release practices.

## The Toolchain

<https://github.com/CCBR/CCBR_NextflowTemplate>

[![](./img/toolchain-components-labeled.jpg)](https://ccbr.github.io/reproducible-toolchain/)

[![](img/class-diagram.svg)](https://github.com/CCBR/CCBR_NextflowTemplate)

## License

This software is licensed under [the MIT license](license.md). Text and
images included in this repository are licensed under the [CC BY-SA 4.0
license](https://creativecommons.org/licenses/by-sa/4.0/).

## Citation

View the [citation file](CITATION.cff) for the citation information for
this project.
