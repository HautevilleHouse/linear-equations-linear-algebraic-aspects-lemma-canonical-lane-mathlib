import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearEquationAdmittedObject where
  systemSpace : Type
  linearSystem : Prop
  kernelStructure : Prop
  solutionSpace : Type
  decomposition : Prop
  conclusion : decomposition

def LinearEquationWitnessClosed (O : LinearEquationAdmittedObject) : Prop :=
  O.decomposition

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse