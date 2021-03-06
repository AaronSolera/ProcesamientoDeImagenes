## -*- texinfo -*-
## @deftypefn  {} {} dummy()
##
## This is a dummy function documentation. This file have a lot functions
## and each one have a little documentation. This text is to avoid a warning when
## install this file as part of package.
## @end deftypefn
##
## Set the graphics toolkit and force read this file as script file (not a function file).
##
graphics_toolkit qt;
##


##
##
## Begin callbacks definitions 
##

## @deftypefn  {} {} Button_7_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of Button_7 control.
##
## @end deftypefn
function Button_7_doIt(src, data, main)

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivados, para activarlos debe activar
% la propiedad 'generateCallback' desde el editor de propiedades

global A file path

[file, path] = uigetfile ({'*.gif;*.png;*.jpg', 'Supported Picture Formats'}); %Ventana de dialogo para seleccionar la imagen
text=fullfile(path, file); %Direccion donde se encuentra la imagen

A = imread(text);
axes(main.Image_1)
imshow(A)
end

## @deftypefn  {} {} ComboBox_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of ComboBox control.
##
## @end deftypefn
function ComboBox_doIt(src, data, main)

global K

filter_id = get(main.ComboBox, 'Value');
a = 0.073235;
b = 0.176765; 
c = 0.125;

switch (filter_id)
	case 1
   		% Apply kernel 1
		K = [a b a; b 0 b; a b a];
  	case 2
   		% Apply kernel 2
		K = [c c c; c 0 c; c c c];
  	otherwise
   		% Apply kernel 1
		K = [a b a; b 0 b; a b a];
endswitch

axes(main.Image_2)
imshow(K)
end

## @deftypefn  {} {} Button_8_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of Button_8 control.
##
## @end deftypefn
function Button_8_doIt(src, data, main)

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivados, para activarlos debe activar
% la propiedad 'generateCallback' desde el editor de propiedades

global R A M K kernel_name
 
filter_id = get(main.ComboBox, 'Value');
tolerance = str2num(get(main.Edit, 'String'));

switch (filter_id)
	case 1
   		kernel_name = "kernel1_";
  	case 2
		kernel_name = "kernel2_";
  	otherwise
		kernel_name = "kernel1_";
endswitch

% Metodo de retaurancion que usa M, K y tolerance en A para generar la imagen restaurada R
R = fast_digital_image_inpainting(A, M, K, tolerance);

axes(main.Image_3)
imshow(R)
end

## @deftypefn  {} {} Button_9_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of Button_9 control.
##
## @end deftypefn
function Button_9_doIt(src, data, main)

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivados, para activarlos debe activar
% la propiedad 'generateCallback' desde el editor de propiedades

global R file path kernel_name

display(["The restored image has been saved at " path kernel_name file]);
imwrite(R, [path kernel_name file]);
end

## @deftypefn  {} {} Button_11_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of Button_11 control.
##
## @end deftypefn
function Button_11_doIt(src, data, main)

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivados, para activarlos debe activar
% la propiedad 'generateCallback' desde el editor de propiedades

figure
info = imread("img/info_app2.png");
imshow(info);
end

## @deftypefn  {} {} Button_5_doIt (@var{src}, @var{data}, @var{main})
##
## Define a callback for default action of Button_5 control.
##
## @end deftypefn
function Button_5_doIt(src, data, main)

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivados, para activarlos debe activar
% la propiedad 'generateCallback' desde el editor de propiedades

global M

[file, path] = uigetfile ({'*.gif;*.png;*.jpg', 'Supported Picture Formats'}); %Ventana de dialogo para seleccionar la imagen
text=fullfile(path, file); %Direccion donde se encuentra la imagen

M = imread(text);
axes(main.Image_4)
imshow(M)
end

 
## @deftypefn  {} {@var{ret} = } show_main()
##
## Create windows controls over a figure, link controls with callbacks and return 
## a window struct representation.
##
## @end deftypefn
function ret = show_main()
  _scrSize = get(0, "screensize");
  _xPos = (_scrSize(3) - 1387)/2;
  _yPos = (_scrSize(4) - 364)/2;
   main = figure ( ... 
	'Color', [0.937 0.937 0.937], ...
	'Position', [_xPos _yPos 1387 364], ...
	'resize', 'off', ...
	'windowstyle', 'normal', ...
	'MenuBar', 'none');
	 set(main, 'visible', 'off');
  Image_1 = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [45 95 265 228]);
  Label_13 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [45 322 264 17], ... 
	'String', 'Original Image', ... 
	'TooltipString', '');
  Image_2 = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [675 95 264 226]);
  Image_3 = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [990 94 265 227]);
  Label_14 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [675 323 263 16], ... 
	'String', 'Kernel', ... 
	'TooltipString', '');
  Label_15 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [990 322 264 17], ... 
	'String', 'Restored Image', ... 
	'TooltipString', '');
  Button_7 = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [41 34 269 25], ... 
	'String', 'Load Image', ... 
	'TooltipString', '');
  ComboBox = uicontrol( ...
	'parent',main, ... 
	'Style','popupmenu', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [671 34 78 25], ... 
	'String', 'kernel1|kernel2', ... 
	'TooltipString', '');
  Button_8 = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [989 34 131 25], ... 
	'String', 'Apply', ... 
	'TooltipString', '');
  Button_9 = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [1126 35 127 24], ... 
	'String', 'Save Image', ... 
	'TooltipString', '');
  Button_11 = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 30, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [1299 301 45 43], ... 
	'String', '?', ... 
	'TooltipString', '');
  Edit = uicontrol( ...
	'parent',main, ... 
	'Style','edit', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [1.000 1.000 1.000], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'left', ... 
	'Position', [850 35 88 22], ... 
	'String', '0.1', ... 
	'TooltipString', '');
  Label_6 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'left', ... 
	'Position', [770 37 74 17], ... 
	'String', 'Tolerance: ', ... 
	'TooltipString', '');
  Image_4 = axes( ...
	'Units', 'pixels', ... 
	'parent',main, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [360 94 265 230]);
  Label_5 = uicontrol( ...
	'parent',main, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [356 322 268 17], ... 
	'String', 'Mask', ... 
	'TooltipString', '');
  Button_5 = uicontrol( ...
	'parent',main, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.937 0.937 0.937], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Ubuntu', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [356 34 268 25], ... 
	'String', 'Load Mask', ... 
	'TooltipString', '');

  main = struct( ...
      'figure', main, ...
      'Image_1', Image_1, ...
      'Label_13', Label_13, ...
      'Image_2', Image_2, ...
      'Image_3', Image_3, ...
      'Label_14', Label_14, ...
      'Label_15', Label_15, ...
      'Button_7', Button_7, ...
      'ComboBox', ComboBox, ...
      'Button_8', Button_8, ...
      'Button_9', Button_9, ...
      'Button_11', Button_11, ...
      'Edit', Edit, ...
      'Label_6', Label_6, ...
      'Image_4', Image_4, ...
      'Label_5', Label_5, ...
      'Button_5', Button_5);


  set (Button_7, 'callback', {@Button_7_doIt, main});
  set (ComboBox, 'callback', {@ComboBox_doIt, main});
  set (Button_8, 'callback', {@Button_8_doIt, main});
  set (Button_9, 'callback', {@Button_9_doIt, main});
  set (Button_11, 'callback', {@Button_11_doIt, main});
  set (Button_5, 'callback', {@Button_5_doIt, main});
  dlg = struct(main);

  set(main.figure, 'visible', 'on');

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivados, para activarlos debe activar
% la propiedad 'generateCallback' desde el editor de propiedades
  ret = main;
end

