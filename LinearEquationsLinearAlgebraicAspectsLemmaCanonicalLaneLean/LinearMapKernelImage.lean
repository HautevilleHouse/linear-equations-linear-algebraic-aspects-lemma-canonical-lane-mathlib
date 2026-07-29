import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.LinearEquationObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearMapKernelImagePackage {V W : LinearSpace} (T : LinearMap V W) where
  kernel : Subspace V
  image : Subspace W
  kernelDefined : Prop
  imageDefined : Prop
  rankNullityRelation : Prop

structure LinearMapKernelImageEvidence {V W : LinearSpace} {T : LinearMap V W} (K : LinearMapKernelImagePackage T) where
  kernelDefinedClosed : K.kernelDefined
  imageDefinedClosed : K.imageDefined
  rankNullityRelationClosed : K.rankNullityRelation

def LinearMapKernelImageClosed {V W : LinearSpace} {T : LinearMap V W} (K : LinearMapKernelImagePackage T) : Prop :=
  K.kernelDefined ∧ K.imageDefined ∧ K.rankNullityRelation

theorem linear_map_kernel_image_closed_from_evidence {V W : LinearSpace} {T : LinearMap V W} (K : LinearMapKernelImagePackage T) (E : LinearMapKernelImageEvidence K) : LinearMapKernelImageClosed K := by
  exact And.intro E.kernelDefinedClosed (And.intro E.imageDefinedClosed E.rankNullityRelationClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse