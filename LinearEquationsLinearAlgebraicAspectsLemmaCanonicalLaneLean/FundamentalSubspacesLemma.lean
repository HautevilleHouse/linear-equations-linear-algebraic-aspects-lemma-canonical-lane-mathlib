import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure FundamentalSubspacesPackage where
  linearMap : Type u → Type v
  kernel : Set (Type u)
  image : Set (Type v)
  cokernel : Set (Type v)
  kernelDimension : Nat
  imageDimension : Nat
  cokernelDimension : Nat

structure FundamentalSubspacesEvidence (F : FundamentalSubspacesPackage) where
  kernelImageRelation : F.kernelDimension + F.imageDimension = F.cokernelDimension  -- placehold

def FundamentalSubspacesClosed (F : FundamentalSubspacesPackage) : Prop :=
  F.kernelDimension + F.imageDimension = F.cokernelDimension

theorem fundamental_subspaces_closed_from_evidence (F : FundamentalSubspacesPackage) (E : FundamentalSubspacesEvidence F) : FundamentalSubspacesClosed F := by
  exact E.kernelImageRelation

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse