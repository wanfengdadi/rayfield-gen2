-- mj

local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,i={function()local b,c,d=a(1)local e return(function(
...)local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.types)
export type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps export type TabProps=j.TabProps export
type TagProps=j.TagProps export type SectionProps=j.SectionProps export type GroupProps=j.GroupProps export type
ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type SliderProps=j.SliderProps export type
DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type KeybindProps=j.KeybindProps export type
ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export type ProgressProps=j.ProgressProps export
type ConsoleProps=j.ConsoleProps export type TextProps=j.TextProps export type DividerProps=j.DividerProps export type
NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type PopupBox=j.PopupBox export type PopupOption=j.
PopupOption export type PopupProps=j.PopupProps export type Moveable=j.Moveable export type Lockable=j.Lockable export
type Window=j.Window export type Tab=j.Tab export type Group=j.Group export type Button=j.Button export type Toggle=j.
Toggle export type Slider=j.Slider export type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.
Keybind export type ColorPicker=j.ColorPicker export type Stat=j.Stat export type Progress=j.Progress export type
Console=j.Console export type Section=j.Section export type TabSection=j.TabSection export type Text=j.Text export type
Divider=j.Divider export type Tag=j.Tag export type Popup=j.Popup export type Rayfield=j.Rayfield type WindowModule={new
:(j.WindowProps)->j.Window}local k={}::Rayfield local function l()local m=Instance.new'ScreenGui'm.Name=f.httpService:
GenerateGUID(false)m.ClipToDeviceSafeArea=false m.DisplayOrder=i.displayOrder.banner m.IgnoreGuiInset=true m.
ResetOnSpawn=false m.Enabled=true m.SafeAreaCompatibility=Enum.SafeAreaCompatibility.None m.ScreenInsets=Enum.
ScreenInsets.DeviceSafeInsets m.ZIndexBehavior=Enum.ZIndexBehavior.Sibling m.Parent=f.guiContainer local n=Instance.new
'ImageLabel'n.Name='Banner'n.AnchorPoint=Vector2.new(0.5,0.5)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.Image=g.resolve(i.icons.banner)n.
Position=UDim2.fromScale(0.5,0.5)n.Size=UDim2.fromOffset(262,60)n.Parent=m return m end function k.CreateWindow(m,n:j.
WindowProps):j.Window local o,p:j.Window?,q:(()->())?=(l())if f.secureMode then g.preload(function(r)if r<=0 then return
end local function s()if not p or p.unloaded then return end p:Notify{title=h.resolve'Secure mode',content=if r==1 then
h.resolve"An asset couldn't be cached and won't appear."else h.resolve"Some assets couldn't be cached and won't appear."
}end if p then s()else q=s end end)end local r,s=pcall(function()return(d(c.components.window)::WindowModule).new(n)end)
if not r then o:Destroy()error(s,0)end local t=s::j.Window p=t if q then task.spawn(q)q=nil end if f.secureMode then
task.spawn(function()local u,v=f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.Medium),f.fontManager:loadFont(i.
fontAsset,Enum.FontWeight.SemiBold)if not t.unloaded and u and v and u~=f.fallbackFont and v~=f.fallbackFont then t:
ChangeTheme{Font=u,TitleFont=v}end end)end task.spawn(function()task.wait(0.5)o:Destroy()task.wait(0.5)if not t.unloaded
then t:Show()end end)return t end return k end)()end,[3]=function()local b,c,d=a(3)local e return(function(...)local f={
}f.__index=f f.__type='Action'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.log),d(g.HapticEngine)
function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)'),name=l.name or l.Name or'Action',icon=assert(l.icon or l.Icon,
'Missing argument (Icon expected)'),callback=assert(l.callback or l.Callback,'Missing argument (Function expected)'),
linkedTab=l.linkedTab or l.LinkedTab},f)m.action=m.window:Create('Frame',{Name=m.name,BorderSizePixel=0,LayoutOrder=-(l.
order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=m.window.actionContainer})m.iconLabel=m.window:
Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(20,20),BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1,Parent=m.action},{ImageColor3=
'ActionColor'})m.interact=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.action}
)local function n()if not m.window:_settled()then return end if m.linkedTab and m.window.selectedTab==m.linkedTab then
return end if m.isLit and m:isLit()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle
.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end m.window:Connect(m.interact.MouseButton1Click,
function()j.click()task.spawn(function()local o,p=pcall(m.callback)if not o then i.warn(`Rayfield encountered an error, with the callback for a {
m.__type} component named '{m.name}':`)i.print(p)end n()end)end)m.window:Connect(m.interact.MouseEnter,function()if not
m.window:_interactive()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.2}):Play()end)m.window:Connect(m.interact.MouseLeave,n)return m end return f
end)()end,[4]=function()local b,c,d=a(4)local e return(function(...)local f={}f.__index=f f.__type='Button'local g=c.
Parent.Parent.utility local h,i,j,k,l,m=d(g.variables),d(g.functions),d(g.moveable),d(g.lockable),d(g.locale),d(g.
HapticEngine)function f.new(n,o)o=if typeof(o)=='table'then o else{}local p=setmetatable({tab=assert(n,
'Missing argument #1 (Tab expected)'),window=n.window,name=o.name or o.Name or'Button',icon=o.icon or o.Icon,description
=o.description or o.Description,compact=n.compact or false,callback=o.callback or o.Callback or function()end},f)if p.
compact then p:_buildCompact()else p:_buildFull()end if p.description and not p.compact then p.descriptor=d(c.Parent.
descriptor).new(p.tab,{description=p.description})end return p end function f._runCallback(n)n.window:_runGuarded(n,n.
callback)end function f._buildFull(n)n.main=n.window:Create('Frame',{Size=UDim2.new(1,-20,0,43),BorderSizePixel=0,Name=n
.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=n.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})n.stroke=n.window:StyleElementBody(n.main)n.hoverOverlay=n.window:
CreateHoverOverlay(n.main)n.container=n.window:Create('Frame',{BorderSizePixel=0,Parent=n.main,Size=UDim2.new(0,170,0,16
),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})n.containerLayout=n.window:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=n.container})if n.icon then n.
iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=n.container},{ImageColor3='ContentColor'})end n.title=n.window:
Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=
16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=n.container},{TextColor3='ContentColor',FontFace='Font'})n.interact=n.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=n.main})n.window:_wireElementHover(n)n.window:ConnectFor(n,n.
interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(n.main,TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,43)}):
Play()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n
.window.theme.ElementStrokeTransparency}):Play()end)end function f._buildCompact(n)local o=n.window n.main,n.stroke,n.
interact=o:_buildCompactRow(n.tab,n.name)n.hoverOverlay=n.interact o:Create('UIPadding',{PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),Parent=n.interact})o:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,6
),Parent=n.interact})if n.icon then n.iconLabel=o:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=n.interact},{ImageColor3=
'ContentColor'})end n.title=o:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=n.interact},{TextColor3='ContentColor',
FontFace='Font'})o:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=n.title})n.window:_wireElementHover(n)n.
window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tw
