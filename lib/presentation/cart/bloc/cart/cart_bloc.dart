// ignore_for_file: unused_import

import 'package:bloc/bloc.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/data/models/responses/product_resnponse_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../widgets/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Loaded([])) {
    on<_Add>((event, emit) {
      final currenState = state as _Loaded;
      final index = currenState.carts
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currenState.carts[index].quantity += 1;
        emit(const _Loading());
        emit(_Loaded(currenState.carts));
      } else {
        emit(_Loaded([...currenState.carts, event.cart]));
      }
    });
    on<_Remove>(
      (event, emit) {
        final currenState = state as _Loaded;
        final index = currenState.carts.indexWhere(
            (element) => element.product.id == event.cart.product.id);
        if (index >= 0) {
          currenState.carts[index].quantity -= 1;

          if (currenState.carts[index].quantity <= 0) {
            currenState.carts.removeAt(index);
          }
          emit(const _Loading());
          emit(_Loaded(currenState.carts));
        }
      },
    );
  }
}
