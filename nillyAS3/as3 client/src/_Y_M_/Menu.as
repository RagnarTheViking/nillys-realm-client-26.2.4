package _Y_M_
{
   import flash.display.Sprite;
   import _05g._02n;
   import flash.display.IGraphicsData;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import com.company.util._t__;
   import flash.display.DisplayObjectContainer;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.util.GraphicHelper;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.filters.DropShadowFilter;
   
   public class Menu extends Sprite implements _02n
   {
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path_:GraphicsPath;
      
      private var background_:uint;
      
      private var _0T_O_:uint;
      
      protected var nextMenuItemY:int;
      
      public function Menu(param1:uint, param2:uint)
      {
         this._0O_n = new GraphicsSolidFill(0,1);
         this.outlineFill_ = new GraphicsSolidFill(0,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this.background_ = param1;
         this._0T_O_ = param2;
         this.nextMenuItemY = 40;
         filters = [new DropShadowFilter(0,0,0,1,16,16)];
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      protected function addMenuItem(param1:MenuItem) : void
      {
         param1.x = 8;
         param1.y = this.nextMenuItemY;
         addChild(param1);
         param1.text_.textChanged.add(this.draw);
         this.nextMenuItemY = this.nextMenuItemY + 28;
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         this.draw();
         this.position();
         if(param1 != null)
         {
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         this.parent.scaleX = 1;
         this.parent.scaleY = 1;
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      protected function onEnterFrame(param1:Event) : void
      {
         if(stage == null)
         {
            return;
         }
         var _loc2_:Rectangle = getRect(stage);
         var _loc3_:Number = _t__._y5(_loc2_,stage.mouseX,stage.mouseY);
         if(_loc3_ > 40)
         {
            this.remove();
         }
      }
      
      public function scaleParent(param1:Boolean) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         if(this.parent is GameSprite)
         {
            _loc2_ = this;
         }
         else
         {
            _loc2_ = this.parent;
         }
         var _loc3_:Number = stage.stageWidth / 800;
         var _loc4_:Number = stage.stageHeight / 600;
         if(param1)
         {
            _loc2_.scaleX = _loc4_ / _loc3_;
            _loc2_.scaleY = 1;
         }
         else
         {
            _loc2_.scaleX = 1 / _loc3_;
            _loc2_.scaleY = 1 / _loc4_;
         }
      }
      
      public function position() : void
      {
         var _loc1_:* = undefined;
         var _loc3_:Number = NaN;
         if(stage == null)
         {
            return;
         }
         _loc1_ = Parameters.data_["uiscale"];
         this.scaleParent(_loc1_);
         var _loc2_:Number = stage.mouseX + (stage.stageWidth - 800) / 2;
         _loc3_ = stage.mouseY + (stage.stageHeight - 600) / 2;
         var _loc4_:Number = 1;
         var _loc5_:Number = 1;
         if(_loc1_)
         {
            _loc2_ = _loc2_ * (600 / stage.stageHeight);
            _loc3_ = _loc3_ * (600 / stage.stageHeight);
            if(this.parent is GameSprite)
            {
               _loc4_ = 800 / stage.stageWidth / (600 / stage.stageHeight);
            }
         }
         else if(this.parent is GameSprite)
         {
            _loc4_ = 800 / stage.stageWidth;
            _loc5_ = 600 / stage.stageHeight;
         }
         if(stage.mouseX + stage.stageWidth / 2 - 400 < stage.stageWidth / 2)
         {
            x = (_loc2_ + 12) * _loc4_;
         }
         else if(!_loc1_ && this.parent is GameSprite)
         {
            x = (_loc2_ - width) * _loc4_ - 1;
         }
         else
         {
            x = _loc2_ * _loc4_ - width - 1;
         }
         if(x < 12)
         {
            x = 12;
         }
         if(stage.mouseY + stage.stageHeight / 2 - 300 < stage.stageHeight / 3)
         {
            y = (_loc3_ + 12) * _loc5_;
         }
         else if(!_loc1_ && this.parent is GameSprite)
         {
            y = (_loc3_ - height) * _loc5_ - 1;
         }
         else
         {
            y = _loc3_ * _loc5_ - height - 1;
         }
         if(y < 12)
         {
            y = 12;
         }
      }
      
      protected function onRollOut(param1:Event) : void
      {
         this.remove();
      }
      
      public function remove() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      protected function draw() : void
      {
         this._0O_n.color = this.background_;
         this.outlineFill_.color = this._0T_O_;
         graphics.clear();
         GraphicHelper.clearGraphicsPath(this.path_);
         var _loc1_:* = 1;
         var _loc2_:* = 1;
         if(this.parent is GameSprite)
         {
            _loc1_ = stage.stageWidth / 800 / (stage.stageHeight / 600);
            if(!Parameters.data_["uiscale"])
            {
               _loc1_ = stage.stageWidth / 800;
               _loc2_ = stage.stageHeight / 600;
            }
         }
         GraphicHelper.drawUi(-6,-6,Math.max(154,width * _loc1_ + 12),height * _loc2_ + 12,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
      }
   }
}
