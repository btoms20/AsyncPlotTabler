import AsyncPlotTabler

struct CategoryBadge:Component {
    let title:String
    let color:Colors
    
    func body() async -> Component {
        await Badge(fill: .solid, shape: .rect, size: .regular, color: color) {
            Text(title)
        }
    }
}
