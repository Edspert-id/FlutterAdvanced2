import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_advance_2/model/banner_model.dart';
import 'package:edspert_advance_2/repository/banner_repository.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc(this.bannerRepository) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerEvent) {
        emit(BannerLoading());
        final result = await bannerRepository.getBannerList();
        emit(BannerSuccess(bannerList: result.data ?? []));
      } else if (event is GetLatestBannerEvent) {
        print('GetLatestBannerEvent');
      }
    });
  }
}
