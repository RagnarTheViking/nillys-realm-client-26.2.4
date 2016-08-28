package _qO_
{
   import _1wl._1H_v;
   import _1wl._U_j;
   import flash.display.Shape;
   import flash.text.TextField;
   import flash.display.Graphics;
   import flash.events.TextEvent;
   import _2F_.Console;
   import flash.text.TextFormat;
   
   public class _1t7 extends _0M_f
   {
      
      public static const _1C_F_:String = "fpsPanel";
      
      public static const _06g:String = "memoryPanel";
       
      
      private var _09e:_1H_v;
      
      private var _0y8:_U_j;
      
      private var _eq:Object;
      
      private var _19H_:String;
      
      private var _15:String;
      
      private var _1V_p:Boolean;
      
      private var _rP_:Shape;
      
      private var graph:Shape;
      
      private var _T_6:TextField;
      
      private var _0X_n:TextField;
      
      public var _1B_w:int = 5;
      
      public function _1t7(param1:Console, param2:int, param3:int, param4:String = null)
      {
         var _loc5_:TextFormat = null;
         this._eq = new Object();
         super(param1);
         this._15 = param4;
         _07a(bg);
         _14b = 32;
         _E_r = 26;
         _loc5_ = new TextFormat();
         var _loc6_:Object = style.styleSheet.getStyle("low");
         _loc5_.font = _loc6_.fontFamily;
         _loc5_.size = _loc6_.fontSize;
         _loc5_.color = style.lowColor;
         this._T_6 = new TextField();
         this._T_6.name = "lowestField";
         this._T_6.defaultTextFormat = _loc5_;
         this._T_6.mouseEnabled = false;
         this._T_6.height = style.menuFontSize + 2;
         addChild(this._T_6);
         this._0X_n = new TextField();
         this._0X_n.name = "highestField";
         this._0X_n.defaultTextFormat = _loc5_;
         this._0X_n.mouseEnabled = false;
         this._0X_n.height = style.menuFontSize + 2;
         this._0X_n.y = style.menuFontSize - 4;
         addChild(this._0X_n);
         _0E_y = _1ae("menuField");
         _0E_y.height = style.menuFontSize + 4;
         _0E_y.y = -3;
         _J_7(_0E_y,this.onMenuRollOver,this._02b);
         _07a(_0E_y);
         addChild(_0E_y);
         this._rP_ = new Shape();
         addChild(this._rP_);
         this.graph = new Shape();
         this.graph.name = "graph";
         this.graph.y = style.menuFontSize;
         addChild(this.graph);
         this._19H_ = "<menu>";
         if(this._15 == _06g)
         {
            this._19H_ = this._19H_ + " <a href=\"event:gc\">G</a> ";
         }
         this._19H_ = this._19H_ + "<a href=\"event:reset\">R</a> <a href=\"event:close\">X</a></menu></low></r>";
         init(param2,param3,true);
      }
      
      private function stop() : void
      {
         if(this._09e)
         {
            console.graphing.remove(this._09e.name);
         }
      }
      
      public function get group() : _1H_v
      {
         return this._09e;
      }
      
      public function reset() : void
      {
         this._eq = {};
         this.graph.graphics.clear();
         if(!this._09e.fixed)
         {
            this._09e.low = NaN;
            this._09e._k4 = NaN;
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this._T_6.y = param1 - style.menuFontSize;
         this._1V_p = true;
         var _loc2_:Graphics = this._rP_.graphics;
         _loc2_.clear();
         _loc2_.lineStyle(1,style.controlColor,0.6);
         _loc2_.moveTo(0,this.graph.y);
         _loc2_.lineTo(width - this._1B_w,this.graph.y);
         _loc2_.lineTo(width - this._1B_w,param1);
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this._T_6.width = param1;
         this._0X_n.width = param1;
         _0E_y.width = param1;
         _0E_y.scrollH = _0E_y.maxScrollH;
         this.graph.graphics.clear();
         this._1V_p = true;
      }
      
      public function update(param1:_1H_v, param2:Boolean) : void
      {
         var _loc3_:_U_j = null;
         var _loc4_:* = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Boolean = false;
         var _loc22_:Boolean = false;
         this._09e = param1;
         var _loc15_:int = 1;
         if(param1._1vS_ > 0)
         {
            _loc15_ = 0;
            if(!this._1V_p)
            {
               return;
            }
         }
         if(this._1V_p)
         {
            param2 = true;
         }
         this._1V_p = false;
         var _loc16_:Array = param1.interests;
         var _loc17_:int = width - this._1B_w;
         var _loc18_:int = height - this.graph.y;
         var _loc19_:Number = param1.low;
         var _loc20_:Number = param1._k4;
         var _loc21_:Number = _loc20_ - _loc19_;
         if(param2)
         {
            TextField(!!param1._14u?this._0X_n:this._T_6).text = String(param1.low);
            TextField(!!param1._14u?this._T_6:this._0X_n).text = String(param1._k4);
            this.graph.graphics.clear();
         }
         for each(_loc3_ in _loc16_)
         {
            this._0y8 = _loc3_;
            _loc5_ = this._0y8.key;
            _loc6_ = this._eq[_loc5_];
            if(_loc6_ == null)
            {
               _loc22_ = true;
               _loc6_ = new Array(this._0y8.col.toString(16),new Array());
               this._eq[_loc5_] = _loc6_;
            }
            _loc7_ = _loc6_[1];
            if(_loc15_ == 1)
            {
               if(param1.type == _1H_v._1C_F_)
               {
                  _loc9_ = Math.floor(param1._k4 / this._0y8.v);
                  if(_loc9_ > 30)
                  {
                     _loc9_ = 30;
                  }
                  while(_loc9_ > 0)
                  {
                     _loc7_.push(this._0y8.v);
                     _loc9_--;
                  }
               }
               else
               {
                  _loc7_.push(this._0y8.v);
               }
            }
            _loc8_ = Math.floor(_loc17_) + 10;
            while(_loc7_.length > _loc8_)
            {
               _loc7_.shift();
            }
            if(param2)
            {
               _loc10_ = _loc7_.length;
               this.graph.graphics.lineStyle(1,this._0y8.col);
               _loc11_ = _loc17_ > _loc10_?int(_loc10_):int(_loc17_);
               _loc12_ = 1;
               while(_loc12_ < _loc11_)
               {
                  _loc13_ = (!!_loc21_?(_loc7_[_loc10_ - _loc12_] - _loc19_) / _loc21_:0.5) * _loc18_;
                  if(!param1._14u)
                  {
                     _loc13_ = _loc18_ - _loc13_;
                  }
                  if(_loc13_ < 0)
                  {
                     _loc13_ = 0;
                  }
                  if(_loc13_ > _loc18_)
                  {
                     _loc13_ = _loc18_;
                  }
                  if(_loc12_ == 1)
                  {
                     this.graph.graphics.moveTo(width,_loc13_);
                  }
                  this.graph.graphics.lineTo(_loc17_ - _loc12_,_loc13_);
                  _loc12_++;
               }
               if(isNaN(this._0y8.avg) && _loc21_)
               {
                  _loc13_ = (this._0y8.avg - _loc19_) / _loc21_ * _loc18_;
                  if(!param1._14u)
                  {
                     _loc13_ = _loc18_ - _loc13_;
                  }
                  if(_loc13_ < 0)
                  {
                     _loc13_ = 0;
                  }
                  if(_loc13_ > _loc18_)
                  {
                     _loc13_ = _loc18_;
                  }
                  this.graph.graphics.lineStyle(1,this._0y8.col,0.3);
                  this.graph.graphics.moveTo(0,_loc13_);
                  this.graph.graphics.lineTo(_loc17_,_loc13_);
               }
            }
         }
         for(_loc4_ in this._eq)
         {
            for each(_loc3_ in _loc16_)
            {
               if(_loc3_.key == _loc4_)
               {
                  _loc14_ = true;
               }
            }
            if(!_loc14_)
            {
               _loc22_ = true;
               delete this._eq[_loc4_];
            }
         }
         if(param2 && (_loc22_ || this._15))
         {
            this._1K_V_();
         }
      }
      
      public function _1K_V_() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = "<r><low>";
         if(this._15)
         {
            if(isNaN(this._0y8.v))
            {
               _loc2_ = _loc2_ + "no input";
            }
            else if(this._15 == _1C_F_)
            {
               _loc2_ = _loc2_ + this._0y8.avg.toFixed(1);
            }
            else
            {
               _loc2_ = _loc2_ + (this._0y8.v + "mb");
            }
         }
         else
         {
            for(_loc1_ in this._eq)
            {
               _loc2_ = _loc2_ + (" <font color=\'#" + this._eq[_loc1_][0] + "\'>" + _loc1_ + "</font>");
            }
            _loc2_ = _loc2_ + " |";
         }
         _0E_y.htmlText = _loc2_ + this._19H_;
         _0E_y.scrollH = _0E_y.maxScrollH;
      }
      
      protected function _02b(param1:TextEvent) : void
      {
         TextField(param1.currentTarget).setSelection(0,0);
         if(param1.text == "reset")
         {
            this.reset();
         }
         else if(param1.text == "close")
         {
            if(this._15 == _1C_F_)
            {
               console.fpsMonitor = false;
            }
            else if(this._15 == _06g)
            {
               console.memoryMonitor = false;
            }
            else
            {
               this.stop();
            }
            console.panels.removeGraph(this._09e);
         }
         else if(param1.text == "gc")
         {
            console.gc();
         }
         param1.stopPropagation();
      }
      
      protected function onMenuRollOver(param1:TextEvent) : void
      {
         var _loc2_:String = !!param1.text?param1.text.replace("event:",""):null;
         if(_loc2_ == "gc")
         {
            _loc2_ = "Garbage collect::Requires debugger version of flash player";
         }
         console.panels.tooltip(_loc2_,this);
      }
   }
}
