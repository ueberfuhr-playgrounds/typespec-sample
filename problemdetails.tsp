import "@typespec/http";

using TypeSpec.Http;

namespace Problems {

  /**
 * Base error response model as defined in RFC 7807 Problem Details for HTTP APIs.
 */
@error
model ProblemDetails {
    @header("content-type") contentType: "application/problem+json";
  
    /**
     * A URI reference [RFC3986] that identifies the problem type.
     */
    type?: string;
  
    /**
     * A short, human-readable summary of the problem type.
     */
    title?: string;
  
    /**
     * The HTTP status code for this occurrence of the problem.
     */
    status?: integer;
  
    /**
     * A human-readable explanation specific to this occurrence of the problem.
     */
    detail?: string;
  
    /**
     * A URI reference that identifies the specific occurrence of the problem.
     */
    instance?: string;
  }
}