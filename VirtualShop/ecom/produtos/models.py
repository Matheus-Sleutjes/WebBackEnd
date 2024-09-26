from django.db import models

# Create your models here.
class Produto(models.Model):
    produto_nome = models.CharField(max_length=100)
    produto_descricao = models.TextField()
    produto_imagem = models.ImageField(upload_to="produtos")