/**
 * User: sholmes
 * Date: Apr 22, 2008
 * Time: 10:44:13 AM
 */
class SecurityFilters {
    def filters = {
        security(controller: '*', action: '*') {
            before = {
                accessControl {
                    role('Administrator') || role('Observer')
                }
            }
        }
    }
}