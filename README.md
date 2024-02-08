# Dešimtainis 16-bitų skaičius į dvejetainį pavidalą



# Paleidimas

Reikia turėti [DOSBox](https://www.dosbox.com/) programą.

Naudokite [TASM](/TASM), kad kompiliuoti kodą.

Pasileidus per DOSBoxą ir užmountinus diską su programa, galime ją sukompiliuoti:

```sh
tasm convert.asm
```

```sh
tlink convert.obj
```

Dabar galime paleist programą

```sh
convert
```

# Išvados

Jei turit kokių nors patarimų, rašykite.

Todo:

- [ ] Įdiegti galimybę trinti skaičius.
- [ ] Patobulinti programos konvercijos rėžių dydį.
