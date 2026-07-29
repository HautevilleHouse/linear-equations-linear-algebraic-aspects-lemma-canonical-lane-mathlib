import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearAdmittedObject where
  vectorSpace : Type u
  dimension : Nat
  basis : List (vectorSpace)
  linearMapDefined : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : LinearAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse