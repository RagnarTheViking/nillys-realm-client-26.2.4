package _0S_w
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import com.company.ui._0H_R_;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.map.GroundLibrary;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.map.RegionLibrary;
   import com.company.util.GraphicHelper;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.filters.DropShadowFilter;
   
   public class _00A_ extends Sprite
   {
      
      public static const WIDTH:int = 134;
      
      public static const HEIGHT:int = 150;
      
      private static const __case:String = ".in { margin-left:10px; text-indent: -10px; }";
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var _1o5:_0S_w._056;
      
      private var _0L_6:_0H_R_;
      
      private var _0oM_:_0H_R_;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      public function _00A_(param1:_0S_w._056)
      {
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this._0O_n = new GraphicsSolidFill(3552822,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this._1o5 = param1;
         this._1W_A_();
         this._0L_6 = new _0H_R_(12,16777215,false,WIDTH - 10,0);
         this._0L_6.filters = [new DropShadowFilter(0,0,0)];
         this._0L_6.y = 4;
         this._0L_6.x = 4;
         addChild(this._0L_6);
         this._0oM_ = new _0H_R_(12,16777215,false,WIDTH - 10,0);
         this._0oM_.wordWrap = true;
         this._0oM_.filters = [new DropShadowFilter(0,0,0)];
         this._0oM_.x = 4;
         this._0oM_.y = 36;
         addChild(this._0oM_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Rectangle = this._1o5._0kl();
         this._0L_6.text = "Position: " + _loc2_.x + ", " + _loc2_.y;
         if(_loc2_.width > 1 || _loc2_.height > 1)
         {
            this._0L_6.text = this._0L_6.text + ("\nRect: " + _loc2_.width + ", " + _loc2_.height);
         }
         this._0L_6._13s();
         var _loc3_:_l4 = this._1o5._1r6(_loc2_.x,_loc2_.y);
         var _loc4_:Vector.<int> = _loc3_ == null?_F_B_._X_s:_loc3_._155;
         var _loc5_:String = _loc4_[_F_B_._1Z_v] == -1?"None":GroundLibrary._M_(_loc4_[_F_B_._1Z_v]);
         var _loc6_:String = _loc4_[_F_B_._W_a] == -1?"None":ObjectLibrary._M_(_loc4_[_F_B_._W_a]);
         var _loc7_:String = _loc4_[_F_B_._V_4] == -1?"None":RegionLibrary._M_(_loc4_[_F_B_._V_4]);
         this._0oM_.htmlText = "<span class=\'in\'>" + "Ground: " + _loc5_ + "\nObject: " + _loc6_ + (_loc3_ == null || _loc3_._09t == null?"":" (" + _loc3_._09t + ")") + "\nRegion: " + _loc7_ + "</span>";
         this._0oM_._13s();
      }
      
      private function _1W_A_() : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
      }
   }
}
