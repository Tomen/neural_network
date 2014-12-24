// Copyright (c) 2014, <Alvaro Arcas Garcia>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library Arquitecture.Connection;

import 'neuron.dart';
import 'weight.dart';

///
/// Link between two neurons that has an associated weight.
///

class Connection {

  Neuron neuronOrigin;
  Neuron neuronDestination;
  Weight weight;

  ///
  /// [new Connection] use to create a connection between to neurons.
  /// Its possible to set a value for the weight associated.
  /// By default the weight value is a random value.
  ///
  /// Example:
  ///   Connection example = new Connection (Neuron a, Neuron b, 2.0); => example.weightValue = 2.0
  ///

  Connection(Neuron origin, Neuron destination, [double value]) {
    if(origin != null && destination != null){
      if(value != null){
        this.weight = new Weight(value);
      }else{
        this.weight = new Weight();
      }
      this.neuronOrigin = origin;
      this.neuronDestination = destination;
    }else{
      throw ("Neuron origin and neuron destination can't be null");
    }
  }

  ///
  /// Return the input value of the neuron destination.
  /// The input is the output of the neuron Origin.
  ///

  double get inputNeuronDestination => this.neuronOrigin.output;

  double get weightValue => this.weight.value;

  void set weightValue(double value) {this.weight.value = value;}

  double get weightPreviousValue => this.weight.previousValue;

  double get weightVariation => this.weight.variation;

  void increment(double value){
    this.weight.increment(value);
  }

}