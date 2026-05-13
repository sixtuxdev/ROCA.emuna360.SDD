yo: Sixto José Romero Martínez
Como: Desarrollador FullStack
Necito: Necesito crear el componente de Clase Parámetros, el cual debe estar todo en un mismo componente, donde en el lado izquierdo tenga una Lista con las Clases y las opciones para crear una clase, y a la derecha tenga los Parámetros donde se carguen según la clase seleccionada que está en la parte izquierda. Importante usar MVVM para este módulo


Criterios de Aceptación:

Necesito aplicar el componente con el estilo que te recomiendo a continuación
Este código es para que lo tomes como base, pero debes aplicar y respetar la arquitectura y el patrón MVVM, junto con los colores institucionales.

Nombre del Componente:
Components/Pages/Clases/ConfigClases.razor


<MudPaper Class="pa-4" Elevation="2">
    <MudGrid>
        <!-- Columna Izquierda: Lista de Clases -->
        <MudItem xs="12" sm="6" md="6">
            <MudCard>
                <MudCardHeader>
                    <CardHeaderContent>
                        <MudText Typo="Typo.h6">Clases Registradas</MudText>
                        <MudText Typo="Typo.body2" Class="mud-text-secondary">
                            Gestione las clases del sistema
                        </MudText>
                    </CardHeaderContent>
                </MudCardHeader>

                <MudCardContent Class="pa-0">
                    @if (_isLoadingClases)
                    {
                        @* Estado de carga *@
                        <div class="d-flex flex-column align-center justify-center py-8">
                            <MudProgressCircular Color="Color.Primary" Indeterminate="true" Size="Size.Large" />
                            <MudText Typo="Typo.body2" Class="mud-text-secondary mt-4">
                                Cargando clases...
                            </MudText>
                        </div>
                    }
                    else if (_clases != null && _clases.Any())
                    {
                        @* Estado con datos *@
                        <MudList T="ClaseDTO" Dense="true" Style="padding: 0;">
                            @foreach (var clase in _clases)
                            {
                                var isSelected = _claseSeleccionada?.ClaseId == clase.ClaseId;
                                var itemStyle = GetClaseItemStyle(isSelected);

                                <MudListItem @key="@clase.ClaseId"
                                             OnClick="() => SeleccionarClase(clase)"
                                             Class="@(isSelected ? "mud-selected-item" : "")"
                                             Style="@itemStyle">

                                    <ItemContent>
                                        <MudGrid Class="pa-3 align-center">
                                            @* Icono + Título + Subtítulo *@
                                            <MudItem xs="12" sm="12" md="12" Class="d-flex align-center">
                                                <MudIcon Icon="@Icons.Material.Filled.Category"
                                                         Color="@(isSelected ? Color.Primary : Color.Secondary)"
                                                         Size="Size.Medium"
                                                         Class="mr-3" />

                                                <div class="flex-grow-1">
                                                    <MudText Typo="Typo.body1" Class="mud-typography-fontWeightMedium">
                                                        @GetClaseTitulo(clase)
                                                    </MudText>
                                                    <MudText Typo="Typo.body2" Class="mud-text-secondary">
                                                        @GetClaseSubtitulo(clase)
                                                    </MudText>
                                                </div>

                                                @* Chip de estado *@
                                                @if (clase.Estado)
                                                {
                                                    <MudChip Color="Color.Success"
                                                             Variant="Variant.Outlined"
                                                             Size="Size.Small"
                                                             Class="ml-2">
                                                        Activa
                                                    </MudChip>
                                                }
                                                else
                                                {
                                                    <MudChip Color="Color.Default"
                                                             Variant="Variant.Outlined"
                                                             Size="Size.Small"
                                                             Class="ml-2">
                                                        Inactiva
                                                    </MudChip>
                                                }

                                                @* Botón Editar *@
                                                <MudTooltip Text="Editar clase">
                                                    <MudIconButton Icon="@Icons.Material.Filled.Edit"
                                                                   Color="Color.Primary"
                                                                   Size="Size.Small"
                                                                   Class="ml-2"
                                                                   OnClick="() => EditarClase(clase)"
                                                                   OnClickStopPropagation="true" />
                                                </MudTooltip>

                                                @* Botón Eliminar *@
                                                <MudTooltip Text="Eliminar clase">
                                                    <MudIconButton Icon="@Icons.Material.Filled.Delete"
                                                                   Color="Color.Error"
                                                                   Size="Size.Small"
                                                                   Class="ml-2"
                                                                   OnClick="() => EliminarClase(clase)"
                                                                   OnClickStopPropagation="true" />
                                                </MudTooltip>
                                            </MudItem>
                                        </MudGrid>
                                    </ItemContent>
                                </MudListItem>
                            }
                        </MudList>
                    }
                    else
                    {
                        @* Estado vacío *@
                        <MudPaper Class="pa-8 ma-4 d-flex flex-column align-center justify-center"
                                  Elevation="0"
                                  Style="background-color: var(--mud-palette-action-disabled-background); border-radius: 8px;">
                            <MudIcon Icon="@Icons.Material.Filled.Category"
                                     Size="Size.Large"
                                     Color="Color.Default"
                                     Class="mb-3" />
                            <MudText Typo="Typo.h6" Class="mud-text-secondary mb-2">
                                No hay clases registradas
                            </MudText>
                            <MudText Typo="Typo.body2" Class="mud-text-secondary text-center">
                                Comience agregando una nueva clase al sistema
                            </MudText>
                        </MudPaper>
                    }
                </MudCardContent>

                <MudCardActions>
                    <MudButton Variant="Variant.Filled" Color="Color.Primary" StartIcon="@Icons.Material.Filled.Add"
                               OnClick="NuevaClase">
                        Nueva Clase
                    </MudButton>
                    <MudSpacer />
                    <MudButton Variant="Variant.Outlined" StartIcon="@Icons.Material.Filled.Refresh"
                               OnClick="CargarClases">
                        Recargar
                    </MudButton>
                </MudCardActions>
            </MudCard>
        </MudItem>

        <!-- Columna Derecha: Lista de Parámetros -->
        <MudItem xs="12" sm="6" md="6">
            <MudCard>
                <MudCardHeader>
                    <CardHeaderContent>
                        <MudText Typo="Typo.h6">Parámetros</MudText>
                        <MudText Typo="Typo.body2" Class="mud-text-secondary">
                            @(_claseSeleccionada != null ? $"Parámetros de {_claseSeleccionada.Descripcion}" : "Seleccione una clase para ver sus parámetros")
                        </MudText>
                    </CardHeaderContent>
                </MudCardHeader>

                <MudCardContent Class="pa-0">
                    @if (_claseSeleccionada == null)
                    {
                        @* Estado sin clase seleccionada *@
                        <MudPaper Class="pa-8 ma-4 d-flex flex-column align-center justify-center"
                                  Elevation="0"
                                  Style="background-color: var(--mud-palette-action-disabled-background); border-radius: 8px;">
                            <MudIcon Icon="@Icons.Material.Filled.Info"
                                     Size="Size.Large"
                                     Color="Color.Default"
                                     Class="mb-3" />
                            <MudText Typo="Typo.h6" Class="mud-text-secondary mb-2">
                                Seleccione una clase
                            </MudText>
                            <MudText Typo="Typo.body2" Class="mud-text-secondary text-center">
                                Para ver y gestionar los parámetros, primero seleccione una clase de la lista
                            </MudText>
                        </MudPaper>
                    }
                    else if (_isLoadingParametros)
                    {
                        @* Estado de carga *@
                        <div class="d-flex flex-column align-center justify-center py-8">
                            <MudProgressCircular Color="Color.Primary" Indeterminate="true" Size="Size.Large" />
                            <MudText Typo="Typo.body2" Class="mud-text-secondary mt-4">
                                Cargando parámetros...
                            </MudText>
                        </div>
                    }
                    else if (_parametros != null && _parametros.Any())
                    {
                        @* Estado con datos *@
                        <MudList T="ParametroDTO" Dense="true" Style="padding: 0;">
                            @foreach (var parametro in _parametros)
                            {
                                var isSelected = _parametroSeleccionado?.ParametroId == parametro.ParametroId;
                                var itemStyle = GetParametroItemStyle(isSelected);

                                <MudListItem @key="@parametro.ParametroId"
                                             OnClick="() => SeleccionarParametro(parametro)"
                                             Class="@(isSelected ? "mud-selected-item" : "")"
                                             Style="@itemStyle">

                                    <ItemContent>
                                        <MudGrid Class="pa-3 align-center">
                                            @* Icono + Título + Subtítulo *@
                                            <MudItem xs="12" sm="12" md="12" Class="d-flex align-center">
                                                <MudIcon Icon="@Icons.Material.Filled.Settings"
                                                         Color="@(isSelected ? Color.Primary : Color.Secondary)"
                                                         Size="Size.Medium"
                                                         Class="mr-3" />

                                                <div class="flex-grow-1">
                                                    <MudText Typo="Typo.body1" Class="mud-typography-fontWeightMedium">
                                                        @GetParametroTitulo(parametro)
                                                    </MudText>
                                                    <MudText Typo="Typo.body2" Class="mud-text-secondary">
                                                        @GetParametroSubtitulo(parametro)
                                                    </MudText>
                                                </div>

                                                @* Chip de estado *@
                                                @if (parametro.Estado)
                                                {
                                                    <MudChip Color="Color.Success"
                                                             Variant="Variant.Outlined"
                                                             Size="Size.Small"
                                                             Class="ml-2">
                                                        Activo
                                                    </MudChip>
                                                }
                                                else
                                                {
                                                    <MudChip Color="Color.Default"
                                                             Variant="Variant.Outlined"
                                                             Size="Size.Small"
                                                             Class="ml-2">
                                                        Inactivo
                                                    </MudChip>
                                                }

                                                @* Botón Editar *@
                                                <MudTooltip Text="Editar parámetro">
                                                    <MudIconButton Icon="@Icons.Material.Filled.Edit"
                                                                   Color="Color.Primary"
                                                                   Size="Size.Small"
                                                                   Class="ml-2"
                                                                   OnClick="() => EditarParametro(parametro)"
                                                                   OnClickStopPropagation="true" />
                                                </MudTooltip>

                                                @* Botón Eliminar *@
                                                <MudTooltip Text="Eliminar parámetro">
                                                    <MudIconButton Icon="@Icons.Material.Filled.Delete"
                                                                   Color="Color.Error"
                                                                   Size="Size.Small"
                                                                   Class="ml-2"
                                                                   OnClick="() => EliminarParametro(parametro)"
                                                                   OnClickStopPropagation="true" />
                                                </MudTooltip>
                                            </MudItem>
                                        </MudGrid>
                                    </ItemContent>
                                </MudListItem>
                            }
                        </MudList>
                    }
                    else
                    {
                        @* Estado vacío *@
                        <MudPaper Class="pa-8 ma-4 d-flex flex-column align-center justify-center"
                                  Elevation="0"
                                  Style="background-color: var(--mud-palette-action-disabled-background); border-radius: 8px;">
                            <MudIcon Icon="@Icons.Material.Filled.Settings"
                                     Size="Size.Large"
                                     Color="Color.Default"
                                     Class="mb-3" />
                            <MudText Typo="Typo.h6" Class="mud-text-secondary mb-2">
                                No hay parámetros registrados
                            </MudText>
                            <MudText Typo="Typo.body2" Class="mud-text-secondary text-center">
                                Esta clase aún no tiene parámetros. Agregue uno nuevo.
                            </MudText>
                        </MudPaper>
                    }
                </MudCardContent>

                <MudCardActions>
                    <MudButton Variant="Variant.Filled" Color="Color.Primary" StartIcon="@Icons.Material.Filled.Add"
                               OnClick="NuevoParametro"
                               Disabled="@(_claseSeleccionada == null)">
                        Nuevo Parámetro
                    </MudButton>
                    <MudSpacer />
                    <MudButton Variant="Variant.Outlined" StartIcon="@Icons.Material.Filled.Refresh"
                               OnClick="CargarParametros"
                               Disabled="@(_claseSeleccionada == null)">
                        Recargar
                    </MudButton>
                </MudCardActions>
            </MudCard>

            @if (_parametroSeleccionado != null)
            {
                <MudCard Class="mt-4">
                    <MudCardHeader>
                        <CardHeaderContent>
                            <MudText Typo="Typo.h6">Asignar Parámetro Padre</MudText>
                            <MudText Typo="Typo.body2" Class="mud-text-secondary">
                                Establezca la jerarquía para @_parametroSeleccionado.Descripcion
                            </MudText>
                        </CardHeaderContent>
                    </MudCardHeader>
                    <MudCardContent>
                        <MudAutocomplete T="ParametroDTO"
                                         Label="Seleccionar Padre"
                                         @bind-Value="_padreSeleccionado"
                                         SearchFunc="@BuscarPadre"
                                         ToStringFunc="@(p => p == null ? "Sin padre" : $"{p.Descripcion} ({(p.ClaseId == _claseSeleccionada?.ClaseId ? "Misma Clase" : "Otra Clase")})")"
                                         Clearable="true"
                                         Placeholder="Escriba para buscar..."
                                         ResetValueOnEmptyText="true"
                                         AdornmentIcon="@Icons.Material.Filled.Search"
                                         AdornmentColor="Color.Primary" />
                    </MudCardContent>
                    <MudCardActions>
                        <MudButton Variant="Variant.Filled" Color="Color.Primary" StartIcon="@Icons.Material.Filled.Save"
                                   OnClick="GuardarAsociacionPadreAsync"
                                   Disabled="@_isSavingPadre">
                            @(_isSavingPadre ? "Guardando..." : "Guardar Asociación")
                        </MudButton>
                        <MudSpacer />
                        <MudButton Variant="Variant.Text" Color="Color.Error" StartIcon="@Icons.Material.Filled.Clear"
                                   OnClick="QuitarAsociacionPadreAsync"
                                   Disabled="@(_parametroSeleccionado.PadreParametroId == null || _isSavingPadre)">
                            Quitar Padre
                        </MudButton>
                    </MudCardActions>
                </MudCard>
            }
        </MudItem>
    </MudGrid>
</MudPaper>

La información debes obtenerla de la API que corresponde para Clases y Parametros las cuales son:
API de Clases:
Controllers/Parameters/ClaseController.cs
API de Parámetros:
Controllers/Parameters/ParametroController.cs

Valida que las api devuelvan correctamente la información y aplicalas en el componente

