import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.LinearEquationObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearAdmissibleClass where
  object : AdmittedLinearObject
  equationSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : equationSatisfied ∨ remainderRecorded

def admittedLinearClosure (A : LinearAdmissibleClass) : Prop :=
  A.object.isInvertible ∧ (A.equationSatisfied ∨ A.remainderRecorded)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse