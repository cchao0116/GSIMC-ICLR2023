<h1 align="center"><b>GSIMC</b></h1>
<p align="center">
    <a href="https://openreview.net/forum?id=G_HSyfLk0m"> <img alt="License" src="https://img.shields.io/static/v1?label=Pub&message=ICLR%2723&color=blue"></a>
    <a href="https://github.com/cchao0116/GSIMC-ICLR2023/blob/main/LICENSE"> <img alt="License" src="https://img.shields.io/github/license/cchao0116/EasyDGL?color=green"></a>
    <a href="https://github.com/cchao0116/GSIMC-ICLR2023/stargazers"><img src="https://img.shields.io/github/stars/cchao0116/GSIMC-ICLR2023?color=yellow&label=Star" alt="Stars"></a>
</p>

The official implementation for
["Graph Signal Sampling for Inductive One-Bit Matrix Completion: a Closed-form Solution"](https://openreview.net/forum?id=G_HSyfLk0m).

<div align=center>
    <img src="docs/overview.png"/>
</div>

## What's news

[2023.04.26] We release the PySpark version of our codes for collaborative filtering.


## Results on Netflix
### Dataset

We use the Netflix benchmark to evaluate model performance, where the Dataframe scheme is as follows:

| Feature Name | Content        |
|:------------:|:---------------|
|     uid      | user identity  |
|     mid      | movie identity |
|     time     | feedback time  |

CSV Download:
[Google](https://drive.google.com/file/d/1ZIZ613YNKe1HxL23VamWuG_bf3x6qa9u/view?usp=share_link),
[夸克](https://pan.quark.cn/s/4f33de48bf2a)

### Results with Rank=50

Below we report the HR@50, HR@100 and NDCG@100 results *on the above provided dataset*.

| Graph Regularization | Laplacian  |  HR@50  | HR@100  | NDCG@100 |
|:---------------------|:----------:|:-------:|:-------:|:--------:|
| Bandlimited Norm     | Hypergraph | 0.19623 | 0.29322 | 0.08761  |
| Diffusion Process    | Hypergraph | 0.18990 | 0.28547 | 0.08682  | 
| Random Walk          | Hypergraph | 0.19512 | 0.29250 | 0.08766  | 
| Inverse Cosine       | Hypergraph | 0.19353 | 0.29130 | 0.08757  | 
| Bandlimited Norm     | Covariance | 0.20030 | 0.29517 | 0.08814  |
| Diffusion Process    | Covariance | 0.19228 | 0.28798 | 0.08675  | 
| Random Walk          | Covariance | 0.19922 | 0.29500 | 0.08817  | 
| Inverse Cosine       | Covariance | 0.19830 | 0.29540 | 0.08831  | 

### Folder Specification

- ```conf/```: configurations for logging
- ```src/```: codes for model definition
- ```runme.sh```: train or evaluate EasyDGL and baseline models

### Run the Code

Download our data to $DATA_HOME directory,
then Reproduce above results on Netflix benchmark:

``` 
bash runme.sh $DATA_HOME
```

## Citation

If you find our codes useful, please consider citing our work

```bibtex
@inproceedings{chen2023graph,
  title={Graph Signal Sampling for Inductive One-Bit Matrix Completion: a Closed-form Solution},
  author={Chao Chen and Haoyu Geng and Gang Zeng and Zhaobing Han and Hua Chai and Xiaokang Yang and Junchi Yan},
  booktitle={Proceedings of the International Conference on Learning Representations (ICLR'23)},
  year={2023},
}
```