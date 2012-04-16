#!/usr/bin/env python
import pylab as pl

def plot():
    experimento = '/home/rafaelbeirigo/ql/experiments/'

    pl.title('134 a 138')
    
    pi1 = pl.loadtxt(experimento + "/134/PRQL/w.out")
    pi2 = pl.loadtxt(experimento + "/135/PRQL/w.out")
    pi3 = pl.loadtxt(experimento + "/136/PRQL/w.out")
    pi4 = pl.loadtxt(experimento + "/137/PRQL/w.out")
    pi5 = pl.loadtxt(experimento + "/138/PRQL/w.out")

    ql = pl.loadtxt(experimento + "/134/QL/w.out")

    pl.xlabel("Episodes")
    pl.ylabel("W")

    pl.plot(pi1,  'o', label = r'Reutilizando $\Pi_1$')
    pl.plot(pi2,  '+', label = r'Reutilizando $\Pi_2$')
    pl.plot(pi3, '--', label = r'Reutilizando $\Pi_3$')
    pl.plot(pi4, '-.', label = r'Reutilizando $\Pi_4$')
    pl.plot(pi5,  ':', label = r'Reutilizando $\Pi_5$')

    pl.plot(ql, label = 'Q-Learning')

    pl.legend(loc = 0)
