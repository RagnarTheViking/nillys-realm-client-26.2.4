package _0S_w
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.ui.ScrollBar;
   import flash.display.Shape;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.company.util.GraphicHelper;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   class _0Z_o extends Sprite
   {
      
      public static const WIDTH:int = 136;
      
      public static const HEIGHT:int = 480;
      
      private static const _t5:int = 20;
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      public var _P_Z_:int;
      
      private var _1J___:Sprite;
      
      public var selected_:_0S_w._1oe;
      
      private var _0__6:ScrollBar;
      
      private var mask_:Shape;
      
      private var _1Z_0:Vector.<_0S_w._1oe>;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      function _0Z_o(param1:int)
      {
         this._1Z_0 = new Vector.<_0S_w._1oe>();
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this._0O_n = new GraphicsSolidFill(3552822,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this._P_Z_ = param1;
         this._1W_A_();
         this._1J___ = new Sprite();
         this._1J___.x = 4;
         this._1J___.y = 6;
         addChild(this._1J___);
         this._0__6 = new ScrollBar(_t5,HEIGHT - 8);
         this._0__6.x = WIDTH - _t5 - 6;
         this._0__6.y = 4;
         this._0__6.addEventListener(Event.CHANGE,this._0f0);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.drawRect(0,2,WIDTH - _t5 - 4,HEIGHT - 4);
         addChild(_loc2_);
         this._1J___.mask = _loc2_;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function _1__N_() : int
      {
         return this.selected_.type_;
      }
      
      public function _B___(param1:int) : void
      {
         var _loc2_:_0S_w._1oe = null;
         for each(_loc2_ in this._1Z_0)
         {
            if(_loc2_.type_ == param1)
            {
               this.setSelected(_loc2_);
               return;
            }
         }
      }
      
      protected function _0y9(param1:_0S_w._1oe) : void
      {
         var _loc2_:int = 0;
         _loc2_ = this._1Z_0.length;
         param1.x = _loc2_ % 2 == 0?Number(0):Number(2 + _0S_w._1oe.WIDTH);
         param1.y = int(_loc2_ / 2) * _0S_w._1oe.HEIGHT + 6;
         this._1J___.addChild(param1);
         if(_loc2_ == 0)
         {
            this.setSelected(param1);
         }
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this._1Z_0.push(param1);
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:_0S_w._1oe = param1.currentTarget as _0S_w._1oe;
         this.setSelected(_loc2_);
      }
      
      protected function setSelected(param1:_0S_w._1oe) : void
      {
         if(this.selected_ != null)
         {
            this.selected_.setSelected(false);
         }
         this.selected_ = param1;
         this.selected_.setSelected(true);
      }
      
      protected function _0f0(param1:Event) : void
      {
         this._1J___.y = 6 - this._0__6._zH_() * (this._1J___.height + 12 - HEIGHT);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         addEventListener(MouseEvent.MOUSE_WHEEL,this._1b2);
         this._0__6._0jj(HEIGHT,this._1J___.height);
         addChild(this._0__6);
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(MouseEvent.MOUSE_WHEEL,this._1b2);
      }
      
      protected function _1b2(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            this._0__6._Y_X_();
         }
         else if(param1.delta < 0)
         {
            this._0__6._03s();
         }
      }
      
      private function _1W_A_() : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
      }
   }
}
