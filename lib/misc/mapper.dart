//*da DTO a Model e viceversa
abstract class DTOMapper<D, M> {
  M toModel(D dto);
  D toDTO(M model);
}
