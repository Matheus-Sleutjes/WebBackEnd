from django.shortcuts import render, redirect
from models import *

def produtos(request):
    if request.method == 'POST':
        data = request.POST
        produto_nome = data.get('produto_nome')
        produto_descricao = data.get('produto_descricao')
        produto_imagem = data.FILES.get('produto_imagem')

        Produto.objects.create(
            produto_nome = produto_nome,
            produto_descricao = produto_descricao,
            produto_imagem = produto_imagem
        )
        return redirect('/')

def deletar_produtos(request):
    query = Produto.objects.get(id=id)
    query.delete()
    return redirect('/')