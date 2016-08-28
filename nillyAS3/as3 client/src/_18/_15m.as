package _18
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.events.MouseEvent;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import com.company.util.GraphicHelper;
   import flash.display.Bitmap;
   
   public class _15m extends Sprite
   {
       
      
      public const _0sT_:Signal = new Signal(String);
      
      public const WIDTH:Number = 186;
      
      public const HEIGHT:Number = 153;
      
      private const _07s:Sprite = new Sprite();
      
      private const background:Sprite = new Sprite();
      
      private const _095:Sprite = new Sprite();
      
      public var _0L_B_:Vector.<_18._jx>;
      
      private var _0j2:Vector.<Sprite>;
      
      public var _1xt:int;
      
      public function _15m()
      {
         this._0L_B_ = new Vector.<_18._jx>();
         this._0j2 = new Vector.<Sprite>();
         super();
         this._07s.addEventListener(MouseEvent.CLICK,this._gd);
         addChild(this._07s);
         this._1W_A_();
         addChild(this._095);
         this._095.y = _0M_3._vK_;
      }
      
      private function _gd(param1:MouseEvent) : void
      {
         this._B_g(param1.target.parent as _18._jx);
      }
      
      public function _8j(param1:uint) : void
      {
         this._B_g(this._0L_B_[param1]);
      }
      
      private function _B_g(param1:_18._jx) : void
      {
         var _loc2_:_18._jx = null;
         if(param1)
         {
            _loc2_ = this._0L_B_[this._1xt];
            if(_loc2_.index != param1.index)
            {
               _loc2_.setSelected(false);
               param1.setSelected(true);
               this._1uL_(param1.index);
               this._0sT_.dispatch(this._0j2[param1.index].name);
            }
         }
      }
      
      public function _1W_A_() : void
      {
         var _loc1_:GraphicsSolidFill = new GraphicsSolidFill(_0M_3._0p0,1);
         var _loc2_:GraphicsPath = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         var _loc3_:Vector.<IGraphicsData> = new <IGraphicsData>[_loc1_,_loc2_,GraphicHelper.END_FILL];
         GraphicHelper.drawUi(0,0,this.WIDTH,this.HEIGHT - _0M_3._vK_,6,[1,1,1,1],_loc2_);
         this.background.graphics.drawGraphicsData(_loc3_);
         this.background.y = _0M_3._vK_;
         addChild(this.background);
      }
      
      public function _1qs() : void
      {
         var _loc1_:uint = 0;
         this._1xt = 0;
         var _loc2_:uint = this._0L_B_.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this._07s.removeChild(this._0L_B_[_loc1_]);
            this._095.removeChild(this._0j2[_loc1_]);
            _loc1_++;
         }
         this._0L_B_ = new Vector.<_18._jx>();
         this._0j2 = new Vector.<Sprite>();
      }
      
      public function _09W_(param1:Bitmap, param2:Sprite) : void
      {
         var _loc3_:int = this._0L_B_.length;
         var _loc4_:_18._jx = this._qi(_loc3_,param1);
         this._0L_B_.push(_loc4_);
         this._07s.addChild(_loc4_);
         this._0j2.push(param2);
         this._095.addChild(param2);
         if(_loc3_ > 0)
         {
            param2.visible = false;
         }
         else
         {
            _loc4_.setSelected(true);
            this._1uL_(0);
            this._0sT_.dispatch(param2.name);
         }
      }
      
      public function _P_7() : void
      {
      }
      
      private function _qi(param1:int, param2:Bitmap) : _18._jx
      {
         var _loc3_:_18._jx = null;
         var _loc4_:Sprite = new _ce();
         _loc3_ = new _18._jx(param1,_loc4_,param2);
         _loc3_.x = param1 * (_loc4_.width + _0M_3._0ci);
         _loc3_.y = _0M_3._1Z_m;
         return _loc3_;
      }
      
      private function _1uL_(param1:int) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         if(param1 != this._1xt)
         {
            _loc2_ = this._0j2[this._1xt];
            _loc3_ = this._0j2[param1];
            _loc2_.visible = false;
            _loc3_.visible = true;
            this._1xt = param1;
         }
      }
   }
}
