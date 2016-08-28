package _113
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.geom.Point;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import emotes.EmoteGraphicHelper;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import com.company.util.GraphicHelper;
   import flash.display.GraphicsPathCommand;
   import flash.filters.DropShadowFilter;
   
   public class _lz extends Sprite implements _1V_O_
   {
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      public var go_:GameObject;
      
      public var lifetime_:int;
      
      public var _1H_I_:Boolean;
      
      public var _1s4:Point;
      
      public var text_:Sprite;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path_:GraphicsPath;
      
      private var startTime_:int = 0;
      
      public function _lz(param1:GameObject, param2:String, param3:uint, param4:Number, param5:uint, param6:Number, param7:uint, param8:int, param9:Boolean, param10:Boolean)
      {
         this._1s4 = new Point();
         this._0O_n = new GraphicsSolidFill(0,1);
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         mouseEnabled = false;
         mouseChildren = false;
         this.go_ = param1;
         this.lifetime_ = param8 * 1000;
         this._1H_I_ = param10;
         this.text_ = this.makeText(param2,param9,param7);
         this.text_.y = this.text_.height;
         addChild(this.text_);
         var _loc11_:int = this.text_.width;
         this._1s4.x = -_loc11_ / 2;
         this._0O_n.color = param3;
         this._0O_n.alpha = param4;
         this.outlineFill_.color = param5;
         this.outlineFill_.alpha = param6;
         graphics.clear();
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(-6,-6,_loc11_ + 12,height + 12,4,[1,1,1,1],this.path_);
         this.path_.commands.splice(6,0,GraphicsPathCommand.LINE_TO,GraphicsPathCommand.LINE_TO,GraphicsPathCommand.LINE_TO);
         var _loc12_:int = height;
         this.path_.data.splice(12,0,_loc11_ / 2 + 8,_loc12_ + 6,_loc11_ / 2,_loc12_ + 18,_loc11_ / 2 - 8,_loc12_ + 6);
         graphics.drawGraphicsData(this.graphicsData_);
         filters = [new DropShadowFilter(0,0,0,1,16,16)];
         this._1s4.y = -height - this.go_.texture_.height * (param1.size_ / 100) * 5 - 2;
         visible = false;
      }
      
      private function makeText(param1:String, param2:Boolean, param3:uint) : Sprite
      {
         var _loc4_:EmoteGraphicHelper = new EmoteGraphicHelper();
         return _loc4_.getChatBubbleText(param1,param2,param3);
      }
      
      public function draw(param1:View, param2:int) : Boolean
      {
         if(this.startTime_ == 0)
         {
            this.startTime_ = param2;
         }
         var _loc3_:int = param2 - this.startTime_;
         if(_loc3_ > this.lifetime_ || this.go_ != null && this.go_.map_ == null)
         {
            return false;
         }
         if(this.go_ == null || !this.go_.isVisible)
         {
            visible = false;
            return true;
         }
         if(this._1H_I_ && !Parameters.data_.textBubbles)
         {
            visible = false;
            return true;
         }
         visible = true;
         x = int(this.go_._P_c[0] + this._1s4.x);
         y = int(this.go_._P_c[1] + this._1s4.y);
         return true;
      }
      
      public function _0w2() : GameObject
      {
         return this.go_;
      }
      
      public function dispose() : void
      {
         parent.removeChild(this);
      }
   }
}
